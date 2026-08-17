import 'dart:math' as math;
import '../../../config/barrel.dart';

class OrbitBody {
  final Color color;
  final double size;
  final int ringIndex; // 0 = outer ring, 1 = middle ring
  final double startAngleDeg;
  final double speed;

  const OrbitBody({
    required this.color,
    required this.size,
    required this.ringIndex,
    required this.startAngleDeg,
    this.speed = 1,
  });
}

/// Animated solar-system style orbit diagram.
/// Height is intentionally NOT full-screen — it only sizes the
/// diagram portion, meant to sit inside a dialog/card.
class OrbitDiagram extends StatefulWidget {
  final String centerImageUrl;
  final double height;
  final List<OrbitBody> bodies;

  const OrbitDiagram({
    super.key,
    required this.centerImageUrl,
    this.height = 220,
    this.bodies = const [
      OrbitBody(color: AppColors.green, size: 18, ringIndex: 0, startAngleDeg: 55),
      OrbitBody(color: AppColors.green, size: 16, ringIndex: 0, startAngleDeg: 195),
      OrbitBody(color: AppColors.red, size: 16, ringIndex: 1, startAngleDeg: 150),
      OrbitBody(color: AppColors.red, size: 18, ringIndex: 1, startAngleDeg: 330),
    ],
  });

  @override
  State<OrbitDiagram> createState() => _OrbitDiagramState();
}

class _OrbitDiagramState extends State<OrbitDiagram>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  static const List<Offset> _backgroundStars = [
    Offset(0.05, 0.15),
    Offset(0.15, 0.78),
    Offset(0.32, 0.92),
    Offset(0.5, 0.06),
    Offset(0.7, 0.88),
    Offset(0.85, 0.18),
    Offset(0.94, 0.58),
    Offset(0.42, 0.48),
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 22),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: widget.height,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final double w = constraints.maxWidth;
          final double h = constraints.maxHeight;
          final Offset center = Offset(w / 2, h / 2);

          final List<Size> ringRadii = [
            Size(w * 0.44, h * 0.40), // outer ring (green)
            Size(w * 0.32, h * 0.28), // middle ring (red)
            Size(w * 0.18, h * 0.15), // inner ring (empty, frames avatar)
          ];

          return Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Container(
                width: h * 0.55,
                height: h * 0.55,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      AppColors.purple.withValues(alpha: 0.35),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),

              for (final star in _backgroundStars)
                Positioned(
                  left: star.dx * w - 2,
                  top: star.dy * h - 2,
                  child: Container(
                    width: 4,
                    height: 4,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.white.withValues(alpha: 0.45),
                    ),
                  ),
                ),

              CustomPaint(
                size: Size(w, h),
                painter: _OrbitRingsPainter(
                  radii: ringRadii,
                  color: AppColors.gold.withValues(alpha: 0.55),
                ),
              ),

              Container(
                width: h * 0.34,
                height: h * 0.34,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.white.withValues(alpha: 0.25),
                    width: 1.2,
                  ),
                ),
                child: ClipOval(
                  child: Image.network(
                    widget.centerImageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              AnimatedBuilder(
                animation: _controller,
                builder: (context, _) {
                  return Stack(
                    clipBehavior: Clip.none,
                    children: widget.bodies.map((body) {
                      final Size ring = ringRadii[body.ringIndex];
                      final double angle = (body.startAngleDeg * math.pi / 180) +
                          (_controller.value * 2 * math.pi * body.speed);
                      final double dx = center.dx + ring.width * math.cos(angle);
                      final double dy = center.dy + ring.height * math.sin(angle);

                      return Positioned(
                        left: dx - body.size / 2,
                        top: dy - body.size / 2,
                        child: Container(
                          width: body.size,
                          height: body.size,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: body.color,
                            boxShadow: [
                              BoxShadow(
                                color: body.color.withValues(alpha: 0.5),
                                blurRadius: 6,
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}

class _OrbitRingsPainter extends CustomPainter {
  final List<Size> radii;
  final Color color;

  const _OrbitRingsPainter({required this.radii, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final Offset center = Offset(size.width / 2, size.height / 2);
    final Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    for (final r in radii) {
      canvas.drawOval(
        Rect.fromCenter(center: center, width: r.width * 2, height: r.height * 2),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _OrbitRingsPainter oldDelegate) {
    return oldDelegate.radii != radii || oldDelegate.color != color;
  }
}