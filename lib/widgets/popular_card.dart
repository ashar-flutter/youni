import 'dart:ui';
import '../config/barrel.dart';

class PopularCard extends StatefulWidget {
  final bool showPlanButton;
  final VoidCallback? onPlanButtonTap;

  const PopularCard({
    super.key,
    this.showPlanButton = false,
    this.onPlanButtonTap,
  });

  @override
  State<PopularCard> createState() => _PopularCardState();
}

class _PopularCardState extends State<PopularCard> {
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
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppColors.purpleOverlay.withValues(alpha: 0.40),
                    AppColors.magentaOverlay.withValues(alpha: 0.40),
                  ],
                ),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: AppColors.purple.withValues(alpha: 0.5),
                  width: 2,
                ),
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
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              AppColors.purpleOverlay.withValues(alpha: 0.30),
                              AppColors.magentaOverlay.withValues(alpha: 0.30),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: AppColors.purple.withValues(alpha: 0.3),
                            width: 1,
                          ),
                        ),
                        child: Center(
                          child: Image.asset(
                            AppImage.crownIcon,
                            width: 6.w,
                            height: 6.w,
                            fit: BoxFit.contain,
                            color: AppColors.purpleLight,
                          ),
                        ),
                      ),
                      SizedBox(width: 5.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 1.h),
                          CustomText(
                            'Youni Pro',
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
                          ),
                          SizedBox(height: 0.5.h),
                          CustomText(
                            'Unlock all features',
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
                        '\$9',
                        fontSize: 32.sp,
                        fontWeight: FontWeight.w700,
                      ),
                      SizedBox(width: 1.5.w),
                      CustomText(
                        '/month',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  ),

                  // Action Icons
                  SizedBox(height: 3.2.h),
                  Row(
                    children:
                        const [
                              FeatureIcon(
                                iconPath: AppImage.robotIcon,
                                color: AppColors.green,
                              ),
                              FeatureIcon(
                                iconPath: AppImage.chatIcon,
                                color: AppColors.primary,
                              ),
                              FeatureIcon(
                                iconPath: AppImage.audioCallIcon,
                                color: AppColors.purple,
                              ),
                              FeatureIcon(
                                iconPath: AppImage.videoCallIcon,
                                color: AppColors.orange,
                              ),
                            ]
                            .map(
                              (icon) => Padding(
                                padding: EdgeInsets.only(right: 3.w),
                                child: icon,
                              ),
                            )
                            .toList(),
                  ),

                  SizedBox(height: 3.h),

                  // Feature List
                  Column(
                    children:
                        const [
                              'All Free Features',
                              'ChatGPT AI Assistant',
                              'Real-time Chat Messages',
                              'Voice Call Support',
                              'Video Call Support',
                              'Access to your Universe',
                              'Advanced To-Do-List',
                            ]
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
                                        gradient: LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                          colors: [
                                            AppColors.purpleOverlay.withValues(
                                              alpha: 0.30,
                                            ),
                                            AppColors.magentaOverlay.withValues(
                                              alpha: 0.30,
                                            ),
                                          ],
                                        ),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(
                                        Icons.check,
                                        size: 3.20.w,
                                        color: AppColors.white,
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

                  // Conditional Plan Button with "Upgrade to Pro" Text
                  if (widget.showPlanButton) ...[
                    SizedBox(height: 3.2.h),
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 3.w),
                        child: PlanButton(
                          onTap: widget.onPlanButtonTap,
                          height: 55.px,
                          text: "Upgrade to Pro",
                        ),
                      ),
                    ),
                    SizedBox(height: 2.h),
                  ],
                ],
              ),
            ),
          ),
        ),

        // Floating Top Badge
        Positioned(
          top: -2.h,
          child: Container(
            height: 5.h,
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [AppColors.gold, AppColors.orange],
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  AppImage.crownIcon,
                  width: 5.8.w,
                  height: 5.8.w,
                  fit: BoxFit.contain,
                  color: AppColors.white,
                ),
                SizedBox(width: 1.5.w),
                CustomText('Popular', fontSize: 14.sp),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
