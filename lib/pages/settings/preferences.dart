import '../../config/barrel.dart';

class Preferences extends StatefulWidget {
  const Preferences({super.key});

  @override
  State<Preferences> createState() => _PreferencesState();
}

class _PreferencesState extends State<Preferences> {
  bool isEmailNotificationEnabled = false;
  bool isMotivationalQuotesEnabled = false;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Padding(
        padding: EdgeInsets.all(3.w),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 0),
          decoration: BoxDecoration(
            color: AppColors.darkBackground.withValues(alpha: 0.70),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.greyMedium, width: 1),
          ),
          child: Column(
            children: [
              const LegalPageAppBar(
                title: 'Application Preferences',
                subtitle: '',
                showSubtitle: false,
                showDivider: false,
              ),

              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        padding: EdgeInsets.symmetric(horizontal: 1.w),
                        child: Column(
                          children: [
                            SizedBox(height: 2.h),

                            _buildPreferenceCard(
                              title: 'Email Notifications',
                              subtitle:
                              'Receive updates about deadlines and reminders.',
                              icon: Padding(
                                padding:  EdgeInsets.only(top: 2.w),
                                child: Image.asset(
                                  AppImage.bellIcon,
                                  width: 5.w,
                                  height: 5.w,
                                  color: AppColors.blueBright,
                                ),
                              ),
                              value: isEmailNotificationEnabled,
                              onChanged: (val) {
                                setState(() {
                                  isEmailNotificationEnabled = val;
                                });
                              },
                            ),

                            SizedBox(height: 1.5.h),

                            _buildPreferenceCard(
                              title: 'Motivational Quotes',
                              subtitle:
                              'See Motivational Quotes on the Splash screen to kick start.',
                              icon: Padding(
                                padding:  EdgeInsets.only(top: 2.w),
                                child: Icon(
                                  Icons.star_outline_rounded,
                                  size: 5.w,
                                  color: AppColors.gold,
                                ),
                              ),
                              value: isMotivationalQuotesEnabled,
                              onChanged: (val) {
                                setState(() {
                                  isMotivationalQuotesEnabled = val;
                                });
                              },
                            ),

                            SizedBox(height: 2.h),
                          ],
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 1.w),
                      child: Column(
                        children: [
                          AppButton(
                            height: 43.px,
                            text: 'Save Changes',
                            fontSize: 15.sp,
                            backgroundColor: AppColors.white.withValues(alpha: 0.05),
                            borderColor: AppColors.white.withValues(alpha: 0.20),
                            onPressed: () {
                              Get.off(
                                    () => const Setting(),
                                transition: Transition.fadeIn,
                              );
                            },
                          ),
                          SizedBox(height: 3.h),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _buildFooterLink(
                                'Terms of Service',
                                onTap: () {
                                  Get.to(
                                        () => const TermsAndConditions(),
                                    transition: Transition.fadeIn,
                                    duration: const Duration(milliseconds: 300),
                                  );
                                },
                              ),
                              _buildFooterLink(
                                'Privacy Policy',
                                onTap: () {
                                  Get.to(
                                        () => const PrivacyPolicy(),
                                    transition: Transition.fadeIn,
                                    duration: const Duration(milliseconds: 300),
                                  );
                                },
                              ),
                              _buildFooterLink(
                                'Contact us',
                                onTap: () {
                                  Get.to(
                                        () => const ContactUs(),
                                    transition: Transition.fadeIn,
                                    duration: const Duration(milliseconds: 300),
                                  );
                                },
                              ),
                            ],
                          ),
                          SizedBox(height: 3.h),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPreferenceCard({
    required String title,
    required String subtitle,
    required Widget icon,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.5.h),
      decoration: BoxDecoration(
        color: AppColors.white.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.white.withValues(alpha: 0.08),
          width: 1,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          icon,
          SizedBox(width: 3.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  title,
                  fontSize: 15.sp,
                ),
                SizedBox(height: 0.3.h),
                CustomText(
                  subtitle,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.white.withValues(alpha: 0.5),
                  height: 1.4,
                ),
              ],
            ),
          ),
          SizedBox(width: 2.w),
          Transform.scale(
            scale: 0.7,
            child: Switch.adaptive(
              value: value,
              onChanged: onChanged,
              activeThumbColor: AppColors.white,
              activeTrackColor: AppColors.blue,
              inactiveThumbColor: AppColors.white.withValues(alpha: 0.6),
              inactiveTrackColor: AppColors.white.withValues(alpha: 0.12),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFooterLink(String text, {required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: CustomText(
        text,
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.white.withValues(alpha: 0.35),
      ),
    );
  }
}