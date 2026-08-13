import '../../config/barrel.dart';

class Security extends StatelessWidget {
  const Security({super.key});

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
                title: 'Change Password',
                subtitle: '',
                showSubtitle: false,
                showDivider: false,
              ),

              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 2.h),

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 2.w),
                        child: Column(
                          children: [
                            AppTextField(
                              fillColor: AppColors.greyDark,
                              height: 44.px,
                              labelText: 'CURRENT PASSWORD',
                              hintText: 'Mark@123',
                              hintColor: AppColors.white,
                              labelSize: 15.sp,
                              hintSize: 15.sp,
                              textSize: 15.sp,
                            ),
                            SizedBox(height: 3.h),

                            AppTextField(
                              height: 44.px,
                              fillColor: AppColors.greyDark,
                              labelText: 'NEW PASSWORD',
                              hintColor: AppColors.white,
                              hintText: '******',
                              labelSize: 15.sp,
                              hintSize: 15.sp,
                              textSize: 15.sp,
                              obscureText: true,
                            ),
                            SizedBox(height: 3.h),

                            AppTextField(
                              height: 44.px,
                              fillColor: AppColors.greyDark,
                              labelText: 'CONFIRM PASSWORD',
                              hintColor: AppColors.white,
                              hintText: '******',
                              labelSize: 15.sp,
                              hintSize: 15.sp,
                              textSize: 15.sp,
                              obscureText: true,
                            ),
                            SizedBox(height: 4.5.h),

                            AppButton(
                              height: 43.px,
                              text: 'Update Password',
                              fontSize: 15.sp,
                              backgroundColor: AppColors.blue,
                              onPressed: () {
                                Get.off(
                                  () => const Setting(),
                                  transition: Transition.fadeIn,
                                );
                              },
                            ),
                            SizedBox(height: 8.h),

                            CustomText(
                              'Deactivate Account',
                              color: AppColors.red,
                            ),
                            SizedBox(height: 0.8.h),
                            CustomText(
                              'Permanently remove your account and all associated data.',
                              fontSize: 13.5.sp,
                              color: AppColors.white.withValues(alpha: 0.5),
                              textAlign: TextAlign.center,
                              fontWeight: FontWeight.w400,
                            ),
                            SizedBox(height: 2.h),

                            AppButton(
                              height: 43.px,
                              text: 'Delete Account',
                              fontSize: 15.sp,
                              backgroundColor: AppColors.red.withValues(
                                alpha: 0.10,
                              ),
                              borderColor: AppColors.red.withValues(alpha: 0.6),
                              textColor: AppColors.red,
                              onPressed: () {
                                SettingPopUp.show(
                                  type: SettingPopUpType.deleteAccount,
                                  onConfirm: () {
                                    // Handle actual delete account logic here
                                  },
                                );
                              },
                            ),
                            SizedBox(height: 4.h),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                _buildFooterLink(
                                  'Terms of Service',
                                  onTap: () {
                                    Get.to(
                                      () => const TermsAndConditions(),
                                      transition: Transition.fadeIn,
                                      duration: const Duration(
                                        milliseconds: 300,
                                      ),
                                    );
                                  },
                                ),
                                _buildFooterLink(
                                  'Privacy Policy',
                                  onTap: () {
                                    Get.to(
                                      () => const PrivacyPolicy(),
                                      transition: Transition.fadeIn,
                                      duration: const Duration(
                                        milliseconds: 300,
                                      ),
                                    );
                                  },
                                ),
                                _buildFooterLink(
                                  'Contact us',
                                  onTap: () {
                                    Get.to(
                                      () => const ContactUs(),
                                      transition: Transition.fadeIn,
                                      duration: const Duration(
                                        milliseconds: 300,
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                            SizedBox(height: 2.h),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
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
