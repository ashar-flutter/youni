import '../config/barrel.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool showPremiumAndFeatures;

  const MainAppBar({super.key, this.showPremiumAndFeatures = true});

  @override
  Size get preferredSize => Size.fromHeight(10.h);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: preferredSize.height,
      padding: EdgeInsets.symmetric(horizontal: 2.w),
      color: Colors.transparent,
      child: SafeArea(
        bottom: false,
        child: Column(
          children: [
            SizedBox(height: 3.h),

            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: 2.w),

                // 1. Logo
                Image.asset(
                  AppImage.youniLogo,
                  height: 3.2.h,
                  fit: BoxFit.contain,
                ),

                // =========================================================
                // Premium User + Feature Icons
                // Visibility maintains the exact same space when hidden.
                // =========================================================
                Visibility(
                  visible: showPremiumAndFeatures,
                  maintainSize: true,
                  maintainAnimation: true,
                  maintainState: true,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(width: 6.w),

                      // 2. Premium User
                      CustomText(
                        'Premium User',
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w500,
                        maxLines: 1,
                      ),

                      SizedBox(width: 1.6.w),

                      // Divider 1
                      Container(
                        width: 1,
                        height: 2.h,
                        color: AppColors.white.withValues(alpha: 0.30),
                      ),

                      SizedBox(width: 1.5.w),

                      // 3. Action Icons Group
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          FeatureIcon(
                            iconPath: AppImage.robotIcon,
                            color: AppColors.green,
                            size: 25.px,
                            iconSize: 13.px,
                          ),

                          SizedBox(width: 1.3.w),

                          // Chat Icon + Badge
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              FeatureIcon(
                                iconPath: AppImage.chatIcon,
                                color: AppColors.blue,
                                size: 25.px,
                                iconSize: 13.px,
                              ),
                              Positioned(
                                top: -3,
                                right: -3,
                                child: Container(
                                  width: 12.px,
                                  height: 12.px,
                                  decoration: const BoxDecoration(
                                    color: AppColors.red,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                    child: CustomText(
                                      '3',
                                      fontSize: 10.sp,
                                      color: AppColors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          SizedBox(width: 1.3.w),

                          FeatureIcon(
                            iconPath: AppImage.audioCallIcon,
                            color: AppColors.purple,
                            size: 25.px,
                            iconSize: 13.px,
                          ),

                          SizedBox(width: 1.3.w),

                          FeatureIcon(
                            iconPath: AppImage.videoCallIcon,
                            color: AppColors.orange,
                            size: 25.px,
                            iconSize: 13.px,
                          ),
                        ],
                      ),

                      SizedBox(width: 1.5.w),

                      // Divider 2
                      Container(
                        width: 1,
                        height: 2.h,
                        color: AppColors.white.withValues(alpha: 0.20),
                      ),

                      SizedBox(width: 2.2.w),
                    ],
                  ),
                ),

                // 4. Help Icon
                Container(
                  width: 20.px,
                  height: 20.px,
                  decoration: const BoxDecoration(
                    color: AppColors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: CustomText(
                      '?',
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w900,
                      color: AppColors.dark,
                    ),
                  ),
                ),

                SizedBox(width: 1.8.w),

                // 5. Profile Avatar
                Container(
                  width: 24.px,
                  height: 24.px,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.greyMedium, width: 1),
                  ),
                  child: ClipOval(
                    child: Image.network(
                      'https://images.unsplash.com/photo-1534528741775-53994a69daeb?auto=format&fit=crop&q=80&w=300',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                SizedBox(width: 1.5.w),
              ],
            ),

            SizedBox(height: 3.h),

            // Bottom Horizontal Divider
            Container(
              height: 1.5,
              width: double.infinity,
              color: AppColors.greyDark,
            ),
          ],
        ),
      ),
    );
  }
}
