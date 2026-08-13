import '../../../config/barrel.dart';

class AccountSubscription extends StatelessWidget {
  const AccountSubscription({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      showBackground: true,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 7.w),
          child: Column(
            children: [
              SizedBox(height: 4.5.h),

              // Logo
              Center(
                child: Image.asset(
                  AppImage.youniLogo,
                  width: 32.w,
                  fit: BoxFit.contain,
                ),
              ),

              SizedBox(height: 6.5.h),

              // FIRST CARD: Free Lunar
              const LunarCard(),

              SizedBox(height: 6.h),

              // SECOND CARD: Youni Pro
              const PopularCard(),

              SizedBox(height: 4.5.h),

              // Bottom Login Button
              AppButton(
                text: 'Login',
                onPressed: () {
                  Get.offAll(
                    () => const Login(),
                    transition: Transition.fadeIn,
                    duration: const Duration(milliseconds: 400),
                  );
                },
                backgroundColor: Colors.transparent,
                borderColor: AppColors.primary,
              ),

              SizedBox(height: 2.5.h),

              // Footer Register Text
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    "Don't have an account? ",
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  onTap(
                    onTap: () {
                      Get.offAll(
                        () => const Register(),
                        transition: Transition.fadeIn,
                        duration: const Duration(milliseconds: 400),
                      );
                    },
                    child: CustomText(
                      'Sign up',
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.blue,
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.primary,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 4.h),
            ],
          ),
        ),
      ),
    );
  }
}
