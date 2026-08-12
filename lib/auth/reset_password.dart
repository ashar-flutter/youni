import '../config/barrel.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

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
                        CustomText('Reset Password', fontSize: 20.sp),

                        SizedBox(height: 3.h),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppTextField(
                              labelText: 'Enter Email Address',
                              hintText: 'Email Address',
                              controller: _emailController,
                              keyboardType: TextInputType.emailAddress,
                            ),
                          ],
                        ),

                        SizedBox(height: 3.h),

                        AppButton(
                          text: 'Send Link',
                          onPressed: () {
                            Get.to(
                              () => ResetPasswordSent(
                                email: _emailController.text,
                              ),
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
