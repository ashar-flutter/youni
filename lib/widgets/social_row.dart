import '../../../config/barrel.dart';

class SocialRow extends StatelessWidget {
  const SocialRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _SocialButton(
          iconPath: AppImage.apple,
          iconColor: AppColors.white,
        ),
        SizedBox(width: 3.2.w),
        const _SocialButton(iconPath: AppImage.google),
        SizedBox(width: 3.2.w),
        const _SocialButton(iconPath: AppImage.facebook),
        SizedBox(width: 3.2.w),
        const _SocialButton(iconPath: AppImage.instagram),
        SizedBox(width: 3.2.w),
        const _SocialButton(iconPath: AppImage.x),
      ],
    );
  }
}

class _SocialButton extends StatelessWidget {
  final String iconPath;
  final Color? iconColor;

  const _SocialButton({required this.iconPath, this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44.px,
      height: 44.px,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.white.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Image.asset(iconPath, fit: BoxFit.contain, color: iconColor),
      ),
    );
  }
}