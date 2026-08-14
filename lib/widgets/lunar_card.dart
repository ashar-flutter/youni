import 'dart:ui';
import '../config/barrel.dart';

class LunarCard extends StatelessWidget {
  final bool showPlanButton;
  final VoidCallback? onPlanButtonTap;

  const LunarCard({
    super.key,
    this.showPlanButton = false,
    this.onPlanButtonTap,
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
                gradient: LinearGradient(
                  colors: [
                    AppColors.blue.withValues(alpha: 0.1),
                    AppColors.blue.withValues(alpha: 0.1),
                  ],
                ),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: AppColors.blue, width: 2),
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
                            colors: [
                              AppColors.blue.withValues(alpha: 0.2),
                              AppColors.blue.withValues(alpha: 0.2),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: AppColors.blue.withValues(alpha: 0.3),
                            width: 1,
                          ),
                        ),
                        child: Center(
                          child: Image.asset(
                            AppImage.starIcon,
                            width: 6.w,
                            height: 6.w,
                            fit: BoxFit.contain,
                            color: AppColors.blue,
                          ),
                        ),
                      ),
                      SizedBox(width: 5.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 1.h),
                          CustomText(
                            'Free Lunar',
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
                          ),
                          SizedBox(height: 0.5.h),
                          CustomText(
                            'Perfect to get started',
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
                        '\$0',
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

                  SizedBox(height: 3.h),

                  // Feature List
                  Column(
                    children: const [
                      'Solar System Project View',
                      'Advanced To-Do-List',
                      'Personal & Project Management',
                      'Tree View Visualization',
                      'Time View Controls',
                      'Status Tracking',
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
                                    AppColors.blue.withValues(
                                      alpha: 0.20,
                                    ),
                                    AppColors.blue.withValues(
                                      alpha: 0.20,
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
                                color: AppColors.white,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                        .toList(),
                  ),

                  // Conditional Plan Button below Status Tracking
                  if (showPlanButton) ...[
                    SizedBox(height: 4.2.h),
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 3.w),
                        child: PlanButton(
                          onTap: onPlanButtonTap,
                          height: 55.px,
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
            height: 4.h,
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [AppColors.blue, AppColors.blue],
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.check, size: 3.5.w, color: AppColors.white),
                SizedBox(width: 1.5.w),
                CustomText('Selected', fontSize: 14.sp),
              ],
            ),
          ),
        ),
      ],
    );
  }
}