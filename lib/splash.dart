import 'dart:ui';
import '../../../config/barrel.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      showBackground: true,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 6.w),
        child: Column(
          children: [
            SizedBox(height: 10.h),

            // Logo Section
            Image.asset(AppImage.youniLogo, width: 55.w, fit: BoxFit.contain),

            SizedBox(height: 15.h),

            // Tagline Text
            CustomText(
              '"Cure the Chaos"',
              fontSize: 18.sp,
              fontWeight: FontWeight.w400,
              textAlign: TextAlign.center,
              font: CustomFont.manrope,
            ),

            SizedBox(height: 4.h),

            // Glass morphism Quote Card
            Stack(
              clipBehavior: Clip.none,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 3.28, sigmaY: 3.28),
                    child: Container(
                      width: 100.w,
                      decoration: BoxDecoration(
                        color: AppColors.white.withValues(alpha: 0.05),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Stack(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 5.w,
                              vertical: 2.h,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(height: 1.h),

                                // Quote Icon
                                Image.asset(
                                  AppImage.quoteIcon,
                                  width: 7.w,
                                  height: 7.w,
                                  fit: BoxFit.contain,
                                ),

                                SizedBox(height: 2.h),

                                // Quote Body Text
                                CustomText(
                                  'It always seems impossible until\nit\'s done.',
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.italic,
                                  textAlign: TextAlign.center,
                                  height: 1.4,
                                ),

                                SizedBox(height: 2.h),

                                // Author Text
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 12.w,
                                      height: 0.68,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                          colors: [
                                            Colors.black.withValues(alpha: 0.0),
                                            AppColors.white,
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 2.w,
                                      ),
                                      child: CustomText(
                                        'Nelson Mandela',
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.white.withValues(
                                          alpha: 0.8,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 12.w,
                                      height: 0.68,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                          colors: [
                                            AppColors.white,
                                            Colors.black.withValues(alpha: 0.0),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                SizedBox(height: 1.h),
                              ],
                            ),
                          ),

                          // Inner Top-Left + Bottom-Right Border
                          Positioned.fill(
                            child: CustomPaint(
                              painter: QuoteCardBorderPainter(
                                color: AppColors.white.withValues(alpha: 0.60),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // Top-left corner accent (bracket tick)
                Positioned(
                  top: -0.5,
                  left: -10,
                  child: Container(
                    width: 18,
                    height: 0.68,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Colors.black.withValues(alpha: 0.0),
                          AppColors.white,
                        ],
                      ),
                    ),
                  ),
                ),

                // Bottom-right corner accent (bracket tick)
                Positioned(
                  bottom: -0.5,
                  right: -10,
                  child: Container(
                    width: 18,
                    height: 0.68,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          AppColors.white,
                          Colors.black.withValues(alpha: 0.0),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 22.h),

            AppButton(
              text: 'Continue',
              onPressed: () {
                Get.offAll(
                      () => const AccountSubscription(),
                  transition: Transition.fadeIn,
                  duration: const Duration(milliseconds: 400),
                );
              },
              backgroundColor: Colors.transparent,
              borderColor: AppColors.primary,
            ),

            SizedBox(height: 2.h),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// Quote Card Inner Top-Left + Bottom-Right Border
// ============================================================

class QuoteCardBorderPainter extends CustomPainter {
  final Color color;

  const QuoteCardBorderPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    const double strokeWidth = 1.13;
    const double radius = 12.0;
    const double cornerLength = 24.0;

    final double inset = strokeWidth / 2;

    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.butt;

    final path = Path();

    // ==========================================================
    // TOP-LEFT — INNER
    // ==========================================================

    path.moveTo(inset, cornerLength);

    path.lineTo(inset, radius);

    path.quadraticBezierTo(inset, inset, radius, inset);

    path.lineTo(cornerLength, inset);

    // ==========================================================
    // BOTTOM-RIGHT — INNER
    // ==========================================================

    path.moveTo(size.width - inset, size.height - cornerLength);

    path.lineTo(size.width - inset, size.height - radius);

    path.quadraticBezierTo(
      size.width - inset,
      size.height - inset,
      size.width - radius,
      size.height - inset,
    );

    path.lineTo(size.width - cornerLength, size.height - inset);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant QuoteCardBorderPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}
