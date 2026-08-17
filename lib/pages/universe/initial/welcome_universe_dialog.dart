import '../../../config/barrel.dart';

/// Shows exactly once per app session, the first time the user
/// lands on Universe. Once dismissed (cross OR button), it will
/// not appear again until the app is restarted.
///
/// Backend note: replace `_hasBeenShown` with a persisted flag
/// (SharedPreferences / user-doc field) when wiring up backend —
/// the call-site (`maybeShow`) stays exactly the same.
class WelcomeUniverseDialog extends StatelessWidget {
  const WelcomeUniverseDialog({super.key});

  static bool _hasBeenShown = false;

  static void maybeShow(BuildContext context) {
    if (_hasBeenShown) return;
    _hasBeenShown = true;

    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: '',
      barrierColor: Colors.black.withValues(alpha: 0.6),
      transitionDuration: const Duration(milliseconds: 280),
      pageBuilder: (context, animation, secondaryAnimation) {
        return const WelcomeUniverseDialog();
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        final curved = CurvedAnimation(
          parent: animation,
          curve: Curves.easeOutCubic,
        );
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, 0.08),
            end: Offset.zero,
          ).animate(curved),
          child: FadeTransition(opacity: curved, child: child),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
      child: Container(
        width: 90.w,
        padding: EdgeInsets.all(5.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: AppColors.white.withValues(alpha: 0.4),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.10),
              offset: const Offset(0, 4),
              blurRadius: 6,
              spreadRadius: -4,
            ),
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.10),
              offset: const Offset(0, 10),
              blurRadius: 15,
              spreadRadius: -3,
            ),
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.nearBlack,
            borderRadius: BorderRadius.circular(16),

          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Diagram section — vertical gradient #1A1A2E -> #0A0A0F
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(top: 8.5.h, bottom: 1.h),
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [AppColors.deepIndigo,
                           AppColors.nearBlack],
                        ),
                      ),
                      child: OrbitDiagram(
                        height: 20.h,
                        centerImageUrl:
                            'https://images.unsplash.com/photo-1534528741775-53994a69daeb?auto=format&fit=crop&q=80&w=300',
                      ),
                    ),
                    Positioned(
                      top: 1.5.h,
                      right: 3.w,
                      child: onTap(
                        onTap: () => Get.back(),
                        child: Icon(
                          Icons.close_rounded,
                          size: 5.5.w,
                          color: AppColors.white.withValues(alpha: 0.8),
                        ),
                      ),
                    ),
                  ],
                ),

                // Text + button section
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
                  child: Column(
                    children: [
                      SizedBox(height: 4.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            AppImage.starIcon,
                            width: 4.5.w,
                            height: 4.5.w,
                            color: AppColors.purple,
                          ),
                          SizedBox(width: 2.5.w),
                          CustomText(
                            'Welcome to Your Universe',
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w700,
                          ),
                          SizedBox(width: 2.5.w),
                          Image.asset(
                            AppImage.starIcon,
                            width: 4.2.w,
                            height: 4.2.w,
                            color: AppColors.purple,
                          ),
                        ],
                      ),

                      SizedBox(height: 1.6.h),

                      CustomText(
                        'Organize your projects and personal goals in an elegant cosmic space. Stars represent projects, comets are personal items, and you can expand each to reveal planets, moons, and satellites within.',
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                        textAlign: TextAlign.center,
                        color: AppColors.white.withValues(alpha: 0.55),
                        height: 1.5,
                      ),

                      SizedBox(height: 4.h),

                      AppButton(
                        height: 46.px,
                        text: 'Explore Your Universe',
                        fontSize: 15.sp,
                        backgroundColor: AppColors.blue,
                        textColor: AppColors.white,
                        borderRadius: 12,
                        onPressed: () => Get.back(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
