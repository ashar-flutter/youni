import '../config/barrel.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({super.key});

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
  TextEditingController();

  @override
  void dispose() {
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
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
                    constraints: BoxConstraints(minHeight: 76.h),
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
                        CustomText('New Password', fontSize: 20.sp),

                        SizedBox(height: 3.h),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppTextField(
                              labelText: 'Enter New Password',
                              hintText: 'Enter New Password',
                              controller: _newPasswordController,
                              obscureText: true,
                            ),
                            SizedBox(height: 3.h),
                            AppTextField(
                              labelText: 'Confirm Password',
                              hintText: 'Confirm Password',
                              controller: _confirmPasswordController,
                              obscureText: true,
                            ),
                          ],
                        ),

                        SizedBox(height: 4.2.h),

                        AppButton(
                          text: 'Reset Password',
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