import '../../config/barrel.dart';

class Drafts extends StatelessWidget {
  const Drafts({super.key});

  // Toggle this to preview the empty-state vs the populated-state.
  static const bool _hasDrafts = true;

  static const List<Map<String, dynamic>> _drafts = [
    {
      'title': 'Beta Sub-Project',
      'subtitle': 'Phase 1 of the beta test.',
      'usesStarAsset': true,
    },
    {
      'title': 'Core Task',
      'subtitle': 'Essential core functionalities to be tested.',
      'usesStarAsset': false,
    },
    {'title': 'Entity Name', 'subtitle': 'Description', 'usesStarAsset': true},
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          const MainAppBar(showPremiumAndFeatures: false),

          SizedBox(height: 3.h),

          const NewEntityRow(),

          SizedBox(height: 3.h),

          // Drafts Content Container
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 7.w),
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.5.h),
            decoration: BoxDecoration(
              color: AppColors.greyDark.withValues(alpha: 0.67),
              borderRadius: BorderRadius.circular(22),
              border: Border.all(color: AppColors.greyDark, width: 1),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Drafts Header
                Row(
                  children: [
                    Image.asset(
                      AppImage.draftIcon,
                      width: 6.5.w,
                      height: 6.5.w,
                      color: AppColors.blue,
                    ),
                    SizedBox(width: 2.5.w),
                    CustomText(
                      'Drafts',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ],
                ),

                SizedBox(height: 1.5.h),

                CustomText(
                  'Stars and Comets without start and end dates. Add dates to move them to Your Universe.',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.white.withValues(alpha: 0.6),
                ),

                SizedBox(height: 2.2.h),

                if (!_hasDrafts) ...[
                  SizedBox(
                    height: 1,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Positioned(
                          left: -5.w,
                          right: -5.w,
                          top: 0,
                          child: Container(
                            height: 1,
                            color: AppColors.white.withValues(alpha: 0.08),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 2.2.h),
                  Center(
                    child: CustomText(
                      'No drafts found.',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.italic,
                      color: AppColors.white.withValues(alpha: 0.4),
                    ),
                  ),
                  SizedBox(height: 0.3.h),
                ] else ...[
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.symmetric(vertical: 1.h),
                    itemCount: _drafts.length,
                    separatorBuilder: (context, index) =>
                        SizedBox(height: 2.1.h),
                    itemBuilder: (context, index) {
                      final draft = _drafts[index];

                      return _DraftCard(
                        title: draft['title'] as String,
                        subtitle: draft['subtitle'] as String,
                        usesStarAsset: draft['usesStarAsset'] as bool,
                        onConfigure: () {},
                        onDelete: () {},
                      );
                    },
                  ),
                ],
              ],
            ),
          ),

          SizedBox(height: 3.h),
        ],
      ),
    );
  }
}

class _DraftCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool usesStarAsset;
  final VoidCallback onConfigure;
  final VoidCallback onDelete;

  const _DraftCard({
    required this.title,
    required this.subtitle,
    required this.usesStarAsset,
    required this.onConfigure,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final Color iconColor = usesStarAsset ? AppColors.gold : AppColors.purple;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: AppColors.darkBackground.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: AppColors.white.withValues(alpha: 0.08),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 0.5.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 9.w,
                height: 9.w,
                decoration: BoxDecoration(
                  color: iconColor.withValues(alpha: 0.15),
                  shape: BoxShape.circle,
                ),
                child: usesStarAsset
                    ? Icon(Icons.star_rounded, size: 4.6.w, color: iconColor)
                    : Padding(
                        padding: EdgeInsets.all(2.4.w),
                        child: Image.asset(
                          AppImage.starIcon,
                          width: 4.6.w,
                          height: 4.6.w,
                          color: iconColor,
                        ),
                      ),
              ),

              SizedBox(width: 3.4.w),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(title, fontSize: 15.8.sp),
                    SizedBox(height: 0.4.h),
                    CustomText(
                      subtitle,
                      fontSize: 12.8.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.white.withValues(alpha: 0.5),
                    ),
                    SizedBox(height: 1.2.h),

                    // Missing timeline configuration badge
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 2.3.w,
                        vertical: 0.9.h,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.gold.withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.calendar_today_outlined,
                            size: 3.w,
                            color: AppColors.gold,
                          ),
                          SizedBox(width: 1.4.w),
                          Padding(
                            padding: EdgeInsets.only(top: 0.2.w),
                            child: CustomText(
                              'Missing timeline configuration',
                              fontSize: 12.2.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.gold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: 1.8.h),

          Row(
            children: [
              onTap(
                onTap: onConfigure,
                child: Container(
                  margin: EdgeInsets.only(left: 13.w),
                  padding: EdgeInsets.symmetric(
                    horizontal: 3.w,
                    vertical: 0.7.h,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.blue.withValues(alpha: 0.20),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: AppColors.blue.withValues(alpha: 0.30),
                      width: 0.47.px,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomText(
                        'Configure',
                        fontSize: 14.sp,
                        color: AppColors.lightBlue.withValues(alpha: 0.75),
                        fontWeight: FontWeight.w500,
                      ),
                      SizedBox(width: 1.2.w),
                      Icon(
                        Icons.arrow_forward_rounded,
                        size: 3.5.w,
                        color: AppColors.lightBlue.withValues(alpha: 0.75),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(width: 2.5.w),

              onTap(
                onTap: onDelete,
                child: Icon(
                  Icons.delete_forever_outlined,
                  size: 5.w,
                  color: AppColors.white,
                ),
              ),
            ],
          ),
          SizedBox(height: 0.6.h),
        ],
      ),
    );
  }
}
