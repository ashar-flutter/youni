import '../config/barrel.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  int _selectedTabIndex = 0; // 0: Personal Account, 1: Corporate Account
  bool _agreedToTerms = false;

  final TextEditingController _corporateIdController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _professionController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _corporateIdController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _professionController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
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
                        // Header Title
                        CustomText('Register', fontSize: 20.sp),

                        SizedBox(height: 2.5.h),

                        // Custom Tab Switcher (Personal / Corporate)
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

                        SizedBox(height: 4.h),

                        // Profile Photo Picker
                       onTap(
                          onTap: () {},
                          child: Container(
                            width: 14.w,
                            height: 14.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.white.withValues(alpha: 0.20),

                            ),
                            child: Icon(
                              Icons.camera_alt_outlined,
                              size: 6.3.w,
                              color: AppColors.white.withValues(alpha: 0.7),
                            ),
                          ),
                        ),

                        SizedBox(height: 3.2.h),

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
                                    labelText: 'Corporate ID',
                                    hintText: 'Corporate ID',
                                    controller: _corporateIdController,
                                  ),
                                  SizedBox(height: 3.h),
                                ],

                                AppTextField(
                                  labelText: 'First Name',
                                  hintText: 'First Name',
                                  controller: _firstNameController,
                                ),

                                SizedBox(height: 3.h),

                                AppTextField(
                                  labelText: 'Last Name',
                                  hintText: 'Last Name',
                                  controller: _lastNameController,
                                ),

                                SizedBox(height: 3.h),

                                AppTextField(
                                  labelText: 'Profession',
                                  hintText: 'Profession',
                                  controller: _professionController,
                                ),

                                SizedBox(height: 3.h),

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

                        SizedBox(height: 2.3.h),

                        // Terms Agreement Checkbox
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 18.px,
                              height: 18.px,
                              child: Checkbox(
                                value: _agreedToTerms,
                                onChanged: (val) {
                                  setState(() {
                                    _agreedToTerms = val ?? false;
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
                            Expanded(
                              child: Padding(
                                padding:  EdgeInsets.only(top: 1.w),
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'I agree to the ',
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      TextSpan(
                                        text: 'Terms of Service',
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.blue,
                                        ),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {},
                                      ),
                                      TextSpan(
                                        text: ' and ',
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      TextSpan(
                                        text: 'Privacy Policy',
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.blue,
                                        ),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {},
                                      ),
                                      TextSpan(
                                        text: '.',
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 4.h),

                        // Primary Action Button
                        AppButton(
                          text: 'Register',
                          onPressed: () {},
                          backgroundColor: Colors.transparent,
                          borderColor: AppColors.primary,
                        ),

                        SizedBox(height: 4.h),

                        // Already have an account Row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText(
                              'Already have an account? ',
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                            onTap(
                              onTap: () {
                                Get.offAll(
                                  () => const Login(),
                                  transition: Transition.fadeIn,
                                  duration: const Duration(milliseconds: 300),
                                );
                              },
                              child: CustomText(
                                'Login',
                                fontSize: 14.sp,
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
