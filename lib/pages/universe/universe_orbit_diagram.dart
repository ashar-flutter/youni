import 'dart:math' as math;
import '../../config/barrel.dart';

enum OrbitStatus { notStarted, inProgress, personnelEvent, dedicatedSpot }

extension OrbitStatusColor on OrbitStatus {
  Color get color {
    switch (this) {
      case OrbitStatus.notStarted:
        return AppColors.red;
      case OrbitStatus.inProgress:
        return AppColors.green;
      case OrbitStatus.personnelEvent:
        return AppColors.purple;
      case OrbitStatus.dedicatedSpot:
        return AppColors.gold;
    }
  }

  String get label {
    switch (this) {
      case OrbitStatus.notStarted:
        return 'Not Started (Red)';
      case OrbitStatus.inProgress:
        return 'In Progress (Green)';
      case OrbitStatus.personnelEvent:
        return 'Personnel Event (Purple)';
      case OrbitStatus.dedicatedSpot:
        return 'Dedicated Spot (Start/End)';
    }
  }
}

/// A single entity on the orbit map. All positions are FRACTIONS
/// (0..1) of the diagram's width/height — this is intentional so
/// a backend can later replace `_defaultBodies` with real
/// (x, y) / angle-derived positions without touching the widget.
class OrbitBody {
  final String id;
  final String label;
  final Offset markerPosition;
  final Offset labelPosition;
  final OrbitStatus status;
  final String? imagePath; // null => plain dot marker (Start/End point)
  final double markerSize;
  final bool hasRingBorder;
  final bool showSatelliteDot;
  final int? badgeCount;

  const OrbitBody({
    required this.id,
    required this.label,
    required this.markerPosition,
    required this.labelPosition,
    required this.status,
    this.imagePath,
    this.markerSize = 34,
    this.hasRingBorder = false,
    this.showSatelliteDot = false,
    this.badgeCount,
  });
}

class OrbitConnector {
  final Offset from;
  final Offset to;
  final Color color;

  const OrbitConnector({
    required this.from,
    required this.to,
    required this.color,
  });
}

class UniverseOrbitDiagram extends StatelessWidget {
  final Offset centerFraction;
  final List<OrbitBody> bodies;
  final List<OrbitConnector> connectors;
  final String centerImageUrl;
  final double height;

  const UniverseOrbitDiagram({
    super.key,
    required this.centerFraction,
    required this.bodies,
    required this.connectors,
    required this.centerImageUrl,
    this.height = 320,
  });

  static const List<Offset> _stars = [
    Offset(0.03, 0.08), Offset(0.10, 0.35), Offset(0.06, 0.62),
    Offset(0.15, 0.90), Offset(0.28, 0.05), Offset(0.35, 0.95),
    Offset(0.50, 0.03), Offset(0.55, 0.92), Offset(0.68, 0.10),
    Offset(0.72, 0.88), Offset(0.85, 0.06), Offset(0.90, 0.30),
    Offset(0.95, 0.55), Offset(0.92, 0.82), Offset(0.20, 0.48),
    Offset(0.60, 0.45), Offset(0.40, 0.30), Offset(0.78, 0.45),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final double w = constraints.maxWidth;
          final double h = constraints.maxHeight;

          return Stack(
            clipBehavior: Clip.none,
            children: [
              // Background stars
              for (final s in _stars)
                Positioned(
                  left: s.dx * w - 1.5,
                  top: s.dy * h - 1.5,
                  child: Container(
                    width: 3,
                    height: 3,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.white.withValues(alpha: 0.5),
                    ),
                  ),
                ),

              // Rings + green wedge (behind everything)
              CustomPaint(
                size: Size(w, h),
                painter: _RingsWedgePainter(centerFraction: centerFraction),
              ),

              // Connector lines
              CustomPaint(
                size: Size(w, h),
                painter: _ConnectorsPainter(connectors: connectors),
              ),

              // Center avatar with glow
              Positioned(
                left: centerFraction.dx * w - (h * 0.14),
                top: centerFraction.dy * h - (h * 0.14),
                child: Container(
                  width: h * 0.28,
                  height: h * 0.28,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.blueBright.withValues(alpha: 0.55),
                        blurRadius: 18,
                        spreadRadius: 2,
                      ),
                    ],
                    border: Border.all(
                      color: AppColors.blueBright.withValues(alpha: 0.6),
                      width: 2,
                    ),
                  ),
                  child: ClipOval(
                    child: Image.network(centerImageUrl, fit: BoxFit.cover),
                  ),
                ),
              ),

              // Bodies (spheres/dots + labels)
              for (final body in bodies) ...[
                Positioned(
                  left: body.markerPosition.dx * w - body.markerSize / 2,
                  top: body.markerPosition.dy * h - body.markerSize / 2,
                  child: _OrbitMarker(body: body),
                ),
                Positioned(
                  left: body.labelPosition.dx * w,
                  top: body.labelPosition.dy * h,
                  child: FractionalTranslation(
                    translation: const Offset(-0.5, 0),
                    child: _OrbitLabelPill(text: body.label),
                  ),
                ),
              ],
            ],
          );
        },
      ),
    );
  }
}

class _OrbitMarker extends StatelessWidget {
  final OrbitBody body;

  const _OrbitMarker({required this.body});

  @override
  Widget build(BuildContext context) {
    final Widget core = body.imagePath != null
        ? Container(
      width: body.markerSize,
      height: body.markerSize,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: body.hasRingBorder
            ? Border.all(color: body.status.color, width: 2)
            : null,
        boxShadow: !body.hasRingBorder
            ? [
          BoxShadow(
            color: body.status.color.withValues(alpha: 0.6),
            blurRadius: 10,
            spreadRadius: 1,
          ),
        ]
            : null,
      ),
      child: ClipOval(
        child: Image.asset(body.imagePath!, fit: BoxFit.cover),
      ),
    )
        : Container(
      width: body.markerSize,
      height: body.markerSize,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: body.status.color,
        boxShadow: [
          BoxShadow(
            color: body.status.color.withValues(alpha: 0.6),
            blurRadius: 6,
          ),
        ],
      ),
    );

    if (!body.showSatelliteDot && body.badgeCount == null) return core;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        core,
        if (body.showSatelliteDot)
          Positioned(
            right: -1,
            bottom: -1,
            child: Container(
              width: body.markerSize * 0.28,
              height: body.markerSize * 0.28,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.blueBright,
                border: Border.all(color: AppColors.dark, width: 1.5),
              ),
            ),
          ),
        if (body.badgeCount != null)
          Positioned(
            right: -4,
            top: -4,
            child: Container(
              padding: const EdgeInsets.all(3),
              constraints: const BoxConstraints(minWidth: 16, minHeight: 16),
              decoration: BoxDecoration(
                color: AppColors.red,
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.dark, width: 1.5),
              ),
              child: Center(
                child: CustomText(
                  '${body.badgeCount}',
                  fontSize: 8.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.white,
                ),
              ),
            ),
          ),
      ],
    );
  }
}

class _OrbitLabelPill extends StatelessWidget {
  final String text;

  const _OrbitLabelPill({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.65),
        borderRadius: BorderRadius.circular(6),
      ),
      child: CustomText(
        text,
        fontSize: 10.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.white,
      ),
    );
  }
}

class _RingsWedgePainter extends CustomPainter {
  final Offset centerFraction;

  const _RingsWedgePainter({required this.centerFraction});

  static const List<double> _ringFactors = [0.92, 0.70, 0.48, 0.26];

  @override
  void paint(Canvas canvas, Size size) {
    final Offset center = Offset(
      centerFraction.dx * size.width,
      centerFraction.dy * size.height,
    );
    final double baseRadius = math.min(size.width, size.height) / 2;

    // Green wedge (fan) pointing toward the upper-left, behind rings
    final double outerRadius = _ringFactors.first * baseRadius;
    final Rect wedgeRect = Rect.fromCircle(center: center, radius: outerRadius);
    final Paint wedgePaint = Paint()
      ..shader = RadialGradient(
        colors: [
          AppColors.green.withValues(alpha: 0.30),
          AppColors.green.withValues(alpha: 0.0),
        ],
      ).createShader(wedgeRect);

    final Path wedgePath = Path()
      ..moveTo(center.dx, center.dy)
      ..arcTo(wedgeRect, _degToRad(-151), _degToRad(60), false)
      ..close();
    canvas.drawPath(wedgePath, wedgePaint);

    // Concentric rings
    final Paint ringPaint = Paint()
      ..color = AppColors.gold.withValues(alpha: 0.55)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    for (final factor in _ringFactors) {
      canvas.drawCircle(center, factor * baseRadius, ringPaint);
    }
  }

  double _degToRad(double deg) => deg * math.pi / 180;

  @override
  bool shouldRepaint(covariant _RingsWedgePainter oldDelegate) {
    return oldDelegate.centerFraction != centerFraction;
  }
}

class _ConnectorsPainter extends CustomPainter {
  final List<OrbitConnector> connectors;

  const _ConnectorsPainter({required this.connectors});

  @override
  void paint(Canvas canvas, Size size) {
    for (final c in connectors) {
      final Paint paint = Paint()
        ..color = c.color.withValues(alpha: 0.85)
        ..strokeWidth = 1.4;
      canvas.drawLine(
        Offset(c.from.dx * size.width, c.from.dy * size.height),
        Offset(c.to.dx * size.width, c.to.dy * size.height),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _ConnectorsPainter oldDelegate) {
    return oldDelegate.connectors != connectors;
  }
}