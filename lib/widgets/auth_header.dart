import '../../../config/barrel.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Universe Background Image
        Positioned(
          top: 10.h,
          left: 17.w,
          right: 0,
          height: 32.h,
          child: Image.asset(AppImage.universe, fit: BoxFit.cover),
        ),

        // Youni Logo on Top Center
        Positioned(
          top: 3.h,
          left: 0,
          right: 0,
          child: Center(
            child: Image.asset(
              AppImage.youniLogo,
              width: 35.w,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ],
    );
  }
}