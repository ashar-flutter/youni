import '../config/barrel.dart';

class LegalPageAppBar extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool showSubtitle;
  final bool showDivider;
  final Color? subtitleColor;
  final double? rightPadding;

  const LegalPageAppBar({
    super.key,
    required this.title,
    required this.subtitle,
    this.showSubtitle = true,
    this.showDivider = true,
    this.subtitleColor,
    this.rightPadding,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 3.h),
        Padding(
          padding: EdgeInsets.only(
            left: rightPadding != null ? 0 : 1.w,
            right: rightPadding ?? 0,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              onTap(
                onTap: () => Get.back(),
                child: Container(
                  width: 7.2.w,
                  height: 7.2.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.white.withValues(alpha: 0.06),
                    border: Border.all(
                      color: AppColors.white.withValues(alpha: 0.15),
                      width: 1,
                    ),
                  ),
                  child: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    size: 2.8.w,
                    color: AppColors.white,
                  ),
                ),
              ),
              SizedBox(width: 3.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(title, fontSize: 17.sp),
                    if (showSubtitle) ...[
                      SizedBox(height: 0.6.h),
                      CustomText(
                        subtitle,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: subtitleColor ?? AppColors.white.withValues(alpha: 0.5),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 4.h),
        if (showDivider) ...[
          Container(
            margin: EdgeInsets.symmetric(horizontal: 3.w),
            height: 2,
            width: double.infinity,
            color: AppColors.white.withValues(alpha: 0.11),
          ),
          SizedBox(height: 2.h),
        ],
      ],
    );
  }
}