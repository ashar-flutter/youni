import '../../config/barrel.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        children: [
          const MainAppBar(showPremiumAndFeatures: false),
          SizedBox(height: 3.3.h),

          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText('Settings', fontSize: 20.sp),
                  SizedBox(height: 0.9.h),
                  CustomText(
                    'Manage your account preferences and subscription',
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.white.withValues(alpha: 0.5),
                  ),
                  SizedBox(height: 4.h),

                  Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView(
                            padding: EdgeInsets.zero,
                            children: [
                              _buildSettingTile(
                                iconPath: AppImage.userIcon,
                                title: 'Account Info',
                                onTap: () => Get.to(
                                  () => const AccountInfo(),
                                  transition: Transition.fadeIn,
                                ),
                              ),
                              SizedBox(height: 2.h),
                              _buildSettingTile(
                                iconPath: AppImage.securityIcon,
                                title: 'Security',
                                onTap: () => Get.to(
                                  () => const Security(),
                                  transition: Transition.fadeIn,
                                ),
                              ),
                              SizedBox(height: 2.h),
                              _buildSettingTile(
                                iconPath: AppImage.subscription,
                                title: 'Subscription',
                                onTap: () {},
                              ),
                              SizedBox(height: 2.h),
                              _buildSettingTile(
                                iconPath: AppImage.bellIcon,
                                title: 'Preferences',
                                onTap: () => Get.to(
                                      () => const Preferences(),
                                  transition: Transition.fadeIn,
                                ),
                              ),
                              SizedBox(height: 2.h),
                            ],
                          ),
                        ),
                        AppButton(
                          height: 45.px,
                          icon: const Icon(Icons.logout),
                          backgroundColor: AppColors.red.withValues(alpha: 0.10),
                          borderColor: AppColors.red.withValues(alpha: 0.6),
                          textColor: AppColors.red,
                          text: 'Logout',
                          onPressed: () {
                            SettingPopUp.show(
                              type: SettingPopUpType.logout,
                              onConfirm: () {
                                // Handle actual logout logic here
                              },
                            );
                          },
                        ),
                        SizedBox(height: 4.h),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingTile({
    required String iconPath,
    required String title,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
        decoration: BoxDecoration(
          color: AppColors.white.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: AppColors.white.withValues(alpha: 0.05),
            width: 1,
          ),
        ),
        child: Row(
          children: [
            SizedBox(width: 1.5.w),
            Image.asset(
              iconPath,
              width: 4.3.w,
              height: 4.3.w,
              color: AppColors.blueBright,
            ),
            SizedBox(width: 4.w),
            CustomText(
              title,
              color: AppColors.blueSky,
              fontSize: 15.sp,
              fontWeight: FontWeight.w400,
            ),
          ],
        ),
      ),
    );
  }
}
