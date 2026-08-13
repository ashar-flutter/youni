import '../../config/barrel.dart';
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  int _selectedTabIndex = 0; // 0: Personal Account, 1: Corporate Account
  bool _rememberMe = false;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _companyIdController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _companyIdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      showBackground: true,
      body: Stack(
        children: [
          const AuthHeader(),

          // Main Scrollable Bottom Sheet Content
          SafeArea(
            bottom: false,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(height: 45.h),

                  // Dark Sheet Container
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
                        // Header Title
                        CustomText('Hey there!', fontSize: 20.sp),

                        SizedBox(height: 2.5.h),

                        // Custom Tab Switcher
                        Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: _TabButton(
                                    title: 'Personal Account',
                                    isSelected: _selectedTabIndex == 0,
                                    onTap: () {
                                      if (_selectedTabIndex != 0) {
                                        setState(() => _selectedTabIndex = 0);
                                      }
                                    },
                                  ),
                                ),
                                Expanded(
                                  child: _TabButton(
                                    title: 'Corporate Account',
                                    isSelected: _selectedTabIndex == 1,
                                    onTap: () {
                                      if (_selectedTabIndex != 1) {
                                        setState(() => _selectedTabIndex = 1);
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 0.8.h),

                            // Single Active Indicator Line Under Selected Tab
                            Stack(
                              children: [
                                const SizedBox(
                                  width: double.infinity,
                                  height: 2,
                                ),
                                AnimatedAlign(
                                  duration: const Duration(milliseconds: 180),
                                  curve: Curves.easeInOut,
                                  alignment: _selectedTabIndex == 0
                                      ? Alignment.centerLeft
                                      : Alignment.centerRight,
                                  child: FractionallySizedBox(
                                    widthFactor: 0.5,
                                    child: Container(
                                      height: 2,
                                      color: AppColors.blue,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                        SizedBox(height: 3.h),

                        // Form Dynamic Input Fields
                        AnimatedSwitcher(
                          duration: const Duration(milliseconds: 150),
                          child: KeyedSubtree(
                            key: ValueKey<int>(_selectedTabIndex),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (_selectedTabIndex == 1) ...[
                                  AppTextField(
                                    labelText: 'Company ID',
                                    hintText: 'Company ID',
                                    controller: _companyIdController,
                                  ),
                                  SizedBox(height: 3.h),
                                ],

                                AppTextField(
                                  labelText: 'Email',
                                  hintText: 'Email',
                                  controller: _emailController,
                                  keyboardType: TextInputType.emailAddress,
                                ),

                                SizedBox(height: 3.h),

                                AppTextField(
                                  labelText: 'Password',
                                  hintText: '********',
                                  controller: _passwordController,
                                  obscureText: true,
                                ),
                              ],
                            ),
                          ),
                        ),

                        SizedBox(height: 1.8.h),

                        // Remember Me & Forgot Password Section
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            onTap(
                              onTap: () {
                                setState(() {
                                  _rememberMe = !_rememberMe;
                                });
                              },
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 18.px,
                                    height: 18.px,
                                    child: Checkbox(
                                      value: _rememberMe,
                                      onChanged: (val) {
                                        setState(() {
                                          _rememberMe = val ?? false;
                                        });
                                      },
                                      activeColor: AppColors.blue,
                                      checkColor: AppColors.white,
                                      side: const BorderSide(
                                        color: AppColors.blue,
                                        width: 1.5,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 2.w),
                                  CustomText(
                                    'Remember Me',
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.blue,
                                  ),
                                ],
                              ),
                            ),
                            onTap(
                              onTap: () {
                                Get.to(
                                      () => const ResetPassword(),
                                  transition: Transition.fadeIn,
                                  duration: const Duration(milliseconds: 300),
                                );
                              },
                              child: CustomText(
                                'Forgot Password',
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.blue,
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 3.h),

                        // Primary Action Button
                        AppButton(
                          text: 'Login',
                          onPressed: () {
                            // Get.offAll(()=> const BottomNavBar());
                          },
                          backgroundColor: Colors.transparent,
                          borderColor: AppColors.primary,
                        ),

                        SizedBox(height: 4.h),

                        // Register Redirection Row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText(
                              "Don't have an account? ",
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                            onTap(
                              onTap: () {
                                Get.to(()=> const Register(),
                                transition: Transition.fadeIn,
                                  duration: Duration(milliseconds: 300)
                                );
                              },
                              child: CustomText(
                                'Signup',
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.blue,
                                decoration: TextDecoration.underline,
                                decorationColor: AppColors.blue,
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 3.h),

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

// Custom Tab Button Component
class _TabButton extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const _TabButton({
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 0.5.h),
          child: CustomText(
            title,
            fontSize: 14.sp,
            fontWeight: isSelected ? FontWeight.w500 : FontWeight.w400,
            color: isSelected
                ? AppColors.blue
                : AppColors.white.withValues(alpha: 0.35),
          ),
        ),
      ),
    );
  }
}