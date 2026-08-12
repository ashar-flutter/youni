import 'dart:ui';
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

              //  Logo
              Center(
                child: Image.asset(
                  AppImage.youniLogo,
                  width: 32.w,
                  fit: BoxFit.contain,
                ),
              ),

              SizedBox(height: 6.5.h),

              // FIRST CARD: Free Lunar (Selected)
              _SubscriptionCard(
                badgeText: 'Selected',
                badgeIcon: Icons.check,
                borderColor: AppColors.primary,
                gradientBackground: LinearGradient(
                  colors: [
                    AppColors.primary.withValues(alpha: 0.1),
                    AppColors.primary.withValues(alpha: 0.1),
                  ],
                ),
                iconContainerGradient: LinearGradient(
                  colors: [
                    AppColors.primary.withValues(alpha: 0.2),
                    AppColors.primary.withValues(alpha: 0.2),
                  ],
                ),
                iconContainerBorderColor: AppColors.primary.withValues(
                  alpha: 0.3,
                ),
                iconColor: AppColors.primary,
                iconWidget: Image.asset(
                  AppImage.starIcon,
                  width: 6.w,
                  height: 6.w,
                  fit: BoxFit.contain,
                  color: AppColors.primary,
                ),
                title: 'Free Lunar',
                subtitle: 'Perfect to get started',
                price: '\$0',
                period: '/month',
                features: const [
                  'Solar System Project View',
                  'Advanced To-Do-List',
                  'Personal & Project Management',
                  'Tree View Visualization',
                  'Time View Controls',
                  'Status Tracking',
                ],
                checkGradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppColors.primary.withValues(alpha: 0.20),
                    AppColors.primary.withValues(alpha: 0.20),
                  ],
                ),
                checkColor: AppColors.white,
                badgeGradient: LinearGradient(
                  colors: [AppColors.primary, AppColors.primary],
                ),
                badgeHeight: 4.h,
              ),

              SizedBox(height: 6.h),

              // SECOND CARD: Youni Pro (Popular)
              _SubscriptionCard(
                badgeText: 'Popular',
                badgeIconPath: AppImage.crownIcon,
                borderColor: AppColors.purple.withValues(alpha: 0.5),
                gradientBackground: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppColors.purpleOverlay.withValues(alpha: 0.40),
                    AppColors.magentaOverlay.withValues(alpha: 0.40),
                  ],
                ),
                iconContainerGradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppColors.purpleOverlay.withValues(alpha: 0.30),
                    AppColors.magentaOverlay.withValues(alpha: 0.30),
                  ],
                ),
                iconContainerBorderColor: AppColors.purple.withValues(
                  alpha: 0.3,
                ),
                iconColor: AppColors.white,
                iconWidget: Image.asset(
                  AppImage.crownIcon,
                  width: 6.w,
                  height: 6.w,
                  fit: BoxFit.contain,
                  color: AppColors.purpleLight,
                ),
                title: 'Youni Pro',
                subtitle: 'Unlock all features',
                price: '\$9',
                period: '/month',
                actionIcons: [
                  _FeatureIcon(
                    iconPath: AppImage.robotIcon,
                    bgColor: AppColors.green.withValues(alpha: 0.2),
                    iconColor: AppColors.green,
                    borderColor: AppColors.green.withValues(alpha: 0.3),
                  ),
                  _FeatureIcon(
                    iconPath: AppImage.chatIcon,
                    bgColor: AppColors.primary.withValues(alpha: 0.2),
                    iconColor: AppColors.primary,
                    borderColor: AppColors.primary.withValues(alpha: 0.3),
                  ),
                  _FeatureIcon(
                    iconPath: AppImage.audioCallIcon,
                    bgColor: AppColors.purple.withValues(alpha: 0.2),
                    iconColor: AppColors.purple,
                    borderColor: AppColors.purple.withValues(alpha: 0.3),
                  ),
                  _FeatureIcon(
                    iconPath: AppImage.videoCallIcon,
                    bgColor: AppColors.orange.withValues(alpha: 0.2),
                    iconColor: AppColors.orange,
                    borderColor: AppColors.orange.withValues(alpha: 0.3),
                  ),
                ],
                features: const [
                  'All Free Features',
                  'ChatGPT AI Assistant',
                  'Real-time Chat Messages',
                  'Voice Call Support',
                  'Video Call Support',
                  'Access to your Universe',
                  'Advanced To-Do-List',
                ],
                checkGradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppColors.purpleOverlay.withValues(alpha: 0.30),
                    AppColors.magentaOverlay.withValues(alpha: 0.30),
                  ],
                ),
                checkColor: AppColors.white,
                badgeGradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [AppColors.gold, AppColors.orange],
                ),
                badgeHeight: 5.h,
              ),

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

class _SubscriptionCard extends StatelessWidget {
  final String badgeText;
  final IconData? badgeIcon;
  final String? badgeIconPath;
  final Gradient badgeGradient;
  final Color borderColor;
  final double badgeHeight;
  final Gradient? gradientBackground;

  // Icon Container
  final Gradient iconContainerGradient;
  final Color iconContainerBorderColor;
  final Color iconColor;
  final Widget iconWidget;

  final String title;
  final String subtitle;
  final String price;
  final String period;
  final List<Widget>? actionIcons;
  final List<String> features;
  final Color checkColor;
  final Gradient checkGradient;

  const _SubscriptionCard({
    required this.badgeText,
    this.badgeIcon,
    required this.checkGradient,
    this.badgeIconPath,
    required this.badgeGradient,
    required this.borderColor,
    required this.badgeHeight,
    this.gradientBackground,

    // Icon Container
    required this.iconContainerGradient,
    required this.iconContainerBorderColor,
    required this.iconColor,
    required this.iconWidget,

    required this.title,
    required this.subtitle,
    required this.price,
    required this.period,
    this.actionIcons,
    required this.features,
    required this.checkColor,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topCenter,
      children: [
        // Main Card Container with Backdrop Filter
        ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              width: 100.w,
              padding: EdgeInsets.fromLTRB(7.w, 3.5.h, 5.w, 3.h),
              decoration: BoxDecoration(
                gradient: gradientBackground,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: borderColor, width: 2),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title Block
                  Row(
                    children: [
                      Container(
                        width: 13.w,
                        height: 13.w,
                        decoration: BoxDecoration(
                          gradient: iconContainerGradient,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: iconContainerBorderColor,
                            width: 1,
                          ),
                        ),
                        child: Center(child: iconWidget),
                      ),
                      SizedBox(width: 5.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 1.h),
                          CustomText(
                            title,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
                          ),
                          SizedBox(height: 0.5.h),
                          CustomText(
                            subtitle,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ],
                      ),
                    ],
                  ),

                  SizedBox(height: 3.h),

                  // Pricing Block
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      CustomText(
                        price,
                        fontSize: 32.sp,
                        fontWeight: FontWeight.w700,
                      ),
                      SizedBox(width: 1.5.w),
                      CustomText(
                        period,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  ),

                  // Action Icons
                  if (actionIcons != null) ...[
                    SizedBox(height: 3.2.h),
                    Row(
                      children: actionIcons!
                          .map(
                            (icon) => Padding(
                              padding: EdgeInsets.only(right: 3.w),
                              child: icon,
                            ),
                          )
                          .toList(),
                    ),
                  ],

                  SizedBox(height: 3.h),

                  // Feature List
                  Column(
                    children: features
                        .map(
                          (feature) => Padding(
                            padding: EdgeInsets.only(bottom: 2.h),
                            child: Row(
                              children: [
                                SizedBox(width: 2.w),

                                Container(
                                  width: 6.w,
                                  height: 6.w,
                                  decoration: BoxDecoration(
                                    gradient: checkGradient,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.check,
                                    size: 3.20.w,
                                    color: checkColor,
                                  ),
                                ),
                                SizedBox(width: 3.2.w),
                                Expanded(
                                  child: CustomText(
                                    feature,
                                    fontSize: 15.sp,
                                    color: AppColors.white.withValues(
                                      alpha: 0.9,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
            ),
          ),
        ),

        // Floating Top Badge
        Positioned(
          top: -2.h,
          child: Container(
            height: badgeHeight,
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            decoration: BoxDecoration(
              gradient: badgeGradient,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (badgeIcon != null)
                  Icon(badgeIcon, size: 3.5.w, color: AppColors.white),
                if (badgeIconPath != null)
                  Image.asset(
                    badgeIconPath!,
                    width: 5.8.w,
                    height: 5.8.w,
                    fit: BoxFit.contain,
                    color: AppColors.white,
                  ),
                SizedBox(width: 1.5.w),
                CustomText(badgeText, fontSize: 14.sp),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _FeatureIcon extends StatelessWidget {
  final String iconPath;
  final Color bgColor;
  final Color iconColor;
  final Color borderColor;

  const _FeatureIcon({
    required this.iconPath,
    required this.bgColor,
    required this.iconColor,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10.5.w,
      height: 10.5.w,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: borderColor, width: 1),
      ),
      child: Center(
        child: Image.asset(
          iconPath,
          width: 5.3.w,
          height: 5.3.w,
          fit: BoxFit.contain,
          color: iconColor,
        ),
      ),
    );
  }
}
