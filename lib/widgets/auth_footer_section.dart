import '../config/barrel.dart';

class AuthFooterSection extends StatelessWidget {
  const AuthFooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // OR Separator Line
        Row(
          children: [
            Expanded(
              child: Container(height: 1, color: AppColors.white),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.w),
              child: CustomText(
                'OR',
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.white,
              ),
            ),
            Expanded(
              child: Container(height: 1, color: AppColors.white),
            ),
          ],
        ),

        SizedBox(height: 2.5.h),

        CustomText(
          'Log in with',
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.white,
        ),

        SizedBox(height: 2.9.h),

        const SocialRow(),

        SizedBox(height: 3.4.h),

        // Bottom Legal Links Row
        Row(
          children: [
            Expanded(
              child: Center(child: _FooterLink(text: 'Terms & Conditions')),
            ),
            Expanded(
              child: Center(child: _FooterLink(text: 'Privacy Policy')),
            ),
            Expanded(
              child: Center(child: _FooterLink(text: 'Contact Us')),
            ),
          ],
        ),
      ],
    );
  }
}

class _FooterLink extends StatelessWidget {
  final String text;

  const _FooterLink({required this.text});

  @override
  Widget build(BuildContext context) {
    return onTap(
      onTap: () {},
      child: CustomText(
        text,
        fontSize: 13.5.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.white.withValues(alpha: 0.5),
      ),
    );
  }
}