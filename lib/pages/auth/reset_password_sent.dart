import '../../config/barrel.dart';

class ResetPasswordSent extends StatelessWidget {
  final String email;

  const ResetPasswordSent({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      showBackground: true,
      body: Stack(
        children: [
          const AuthHeader(),

          SafeArea(
            bottom: false,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(height: 45.h),

                  Container(
                    width: 100.w,
                    constraints: BoxConstraints(minHeight: 62.h),
                    padding: EdgeInsets.symmetric(
                      horizontal: 5.w,
                      vertical: 3.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.dark,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(26),
                        topRight: Radius.circular(26),
                      ),
                      border: Border.all(
                        color: AppColors.white.withValues(alpha: 0.08),
                        width: 1,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomText(
                          'Reset Password',
                          fontSize: 20.sp,
                        ),

                        SizedBox(height: 4.h),

                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "We've sent a password reset link to ",
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w400,
                                  height: 1.5,
                                ),
                              ),
                              TextSpan(
                                text: email,
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.blue,
                                  decoration: TextDecoration.underline,
                                  decorationColor: AppColors.blue,
                                ),
                              ),
                              TextSpan(
                                text:
                                '\nClick the link in the email to verify your account\nand set a new password.',
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w400,
                                  height: 1.5,
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 2.5.h),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText(
                              "If you didn't receive email. ",
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w400,
                            ),
                            onTap(
                              onTap: () {
                                Get.to(()=> NewPassword(),
                                transition: Transition.fadeIn,
                                  duration: Duration(milliseconds: 300)
                                );
                              },
                              child: CustomText(
                                'Resend',
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.blue,
                                decoration: TextDecoration.underline,
                                decorationColor: AppColors.blue,
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 4.h),
                        AppButton(
                          text: 'Go To Sign In Page',
                          onPressed: () {
                            Get.offAll(
                                  () => const Login(),
                              transition: Transition.fadeIn,
                              duration: const Duration(milliseconds: 300),
                            );
                          },
                          backgroundColor: Colors.transparent,
                          borderColor: AppColors.primary,
                        ),

                        SizedBox(height: 4.h),

                        const AuthFooterSection(),
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
}