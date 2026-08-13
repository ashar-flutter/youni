import '../../config/barrel.dart';

class AccountInfo extends StatelessWidget {
  const AccountInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Padding(
        padding: EdgeInsets.all(3.w),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          decoration: BoxDecoration(
            color: AppColors.darkBackground.withValues(alpha: 0.70),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.greyMedium, width: 1),
          ),
          child: Column(
            children: [
              const LegalPageAppBar(
                title: 'Account Info',
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
                      CircleAvatar(
                        radius: 8.w,
                        backgroundImage: const NetworkImage(
                          'https://images.unsplash.com/photo-1534528741775-53994a69daeb?auto=format&fit=crop&q=80&w=300',
                        ),
                      ),
                      SizedBox(height: 2.5.h),

                      SizedBox(
                        width: 38.w,
                        height: 4.5.h,
                        child: AppButton(
                          text: 'Upload new image',
                          backgroundColor: AppColors.blue,
                          textColor: AppColors.white,
                          fontSize: 15.sp,
                          borderRadius: 8,
                          onPressed: () {},
                        ),
                      ),
                      SizedBox(height: 1.8.h),

                      CustomText(
                        'At least 800x800 px recommended.\nJPG or PNG and JPEG is allowed',
                        fontSize: 14.sp,
                        textAlign: TextAlign.center,
                        color: AppColors.white.withValues(alpha: 0.4),
                      ),
                      SizedBox(height: 3.5.h),

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 2.w),
                        child: Column(
                          children: [
                            AppTextField(
                              fillColor: AppColors.greyDark,
                              height: 44.px,
                              labelText: "First Name",
                              hintText: 'MARK',
                              hintColor: AppColors.white,
                              labelSize: 15.sp,
                              hintSize: 15.sp,
                              textSize: 15.sp,
                            ),
                            SizedBox(height: 3.h),

                            AppTextField(
                              height: 44.px,
                              fillColor: AppColors.greyDark,
                              labelText: "Last Name",
                              hintColor: AppColors.white,
                              hintText: 'BEZOS',
                              labelSize: 15.sp,
                              hintSize: 15.sp,
                              textSize: 15.sp,
                            ),
                            SizedBox(height: 3.h),

                            AppTextField(
                              height: 44.px,
                              fillColor: AppColors.greyDark,
                              labelText: "Date of birth",
                              hintColor: AppColors.white,
                              hintText: 'MM/DD/YYYY',
                              labelSize: 15.sp,
                              hintSize: 15.sp,
                              textSize: 15.sp,
                            ),
                            SizedBox(height: 3.h),

                            AppTextField(
                              height: 44.px,
                              fillColor: AppColors.greyDark,
                              labelText: "Profession",
                              hintText: 'STUDENT',
                              hintColor: AppColors.white,
                              labelSize: 15.sp,
                              hintSize: 15.sp,
                              textSize: 15.sp,
                            ),
                            SizedBox(height: 4.5.h),

                            AppButton(
                              height: 43.px,
                              text: 'Save Changes',
                              fontSize: 15.sp,
                              backgroundColor: AppColors.white.withValues(
                                alpha: 0.05,
                              ),
                              borderColor: AppColors.white.withValues(
                                alpha: 0.2,
                              ),
                              textColor: AppColors.white,
                              onPressed: () {
                                Get.off(
                                  () => const Setting(),
                                  transition: Transition.fadeIn,
                                );
                              },
                            ),
                            SizedBox(height: 5.h),
                          ],
                        ),
                      ),

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
                      SizedBox(height: 2.h),
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
        color: AppColors.white.withValues(alpha: 0.35),
      ),
    );
  }
}
