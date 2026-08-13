import '../../config/barrel.dart';

class Archive extends StatelessWidget {
  const Archive({super.key});

  static const List<Map<String, dynamic>> _items = [
    {
      'type': 'Project',
      'title': 'Project Alpha',
      'dateRange': '2023-01-01 - 2023-12-31',
      'isCompleted': false,
      'usesStarAsset': false,
    },
    {
      'type': 'Project',
      'title': 'Project Beta',
      'dateRange': '2024-01-01 - 2024-09-30',
      'isCompleted': true,
      'usesStarAsset': false,
    },
    {
      'type': 'Personal Item',
      'title': 'Personal Goal',
      'dateRange': '2023-01-01 - 2023-12-31',
      'isCompleted': false,
      'usesStarAsset': true,
    },
    {
      'type': 'Personal Item',
      'title': 'Morning Routine',
      'dateRange': '2023-01-01 - 2023-12-31',
      'isCompleted': false,
      'usesStarAsset': true,
    },
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

          // Archive Content Container
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 6.w),
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.5.h),
            decoration: BoxDecoration(
              color: AppColors.greyDark.withValues(alpha: 0.67),
              borderRadius: BorderRadius.circular(18),

              border: Border.all(color: AppColors.greyDark, width: 1),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 1.h),

                // Archive Header
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
                      'Archive',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ],
                ),

                SizedBox(height: 1.h),

                CustomText(
                  "Archived items you've completed or are overdue.",
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.white.withValues(alpha: 0.6),
                ),

                SizedBox(height: 2.h),

                // Archive Cards
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(vertical: 1.h),
                  itemCount: _items.length,
                  separatorBuilder: (context, index) => SizedBox(height: 2.1.h),
                  itemBuilder: (context, index) {
                    final item = _items[index];

                    return _ArchiveCard(
                      type: item['type'] as String,
                      title: item['title'] as String,
                      dateRange: item['dateRange'] as String,
                      isCompleted: item['isCompleted'] as bool,
                      usesStarAsset: item['usesStarAsset'] as bool,
                      onEditRestore: () {},
                      onDelete: () {},
                    );
                  },
                ),
              ],
            ),
          ),

          SizedBox(height: 3.h),
        ],
      ),
    );
  }
}

class _ArchiveCard extends StatelessWidget {
  final String type;
  final String title;
  final String dateRange;
  final bool isCompleted;
  final bool usesStarAsset;
  final VoidCallback onEditRestore;
  final VoidCallback onDelete;

  const _ArchiveCard({
    required this.type,
    required this.title,
    required this.dateRange,
    required this.isCompleted,
    required this.usesStarAsset,
    required this.onEditRestore,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final Color statusColor = isCompleted ? AppColors.green : Colors.redAccent;

    final Color iconColor = usesStarAsset ? AppColors.purple : AppColors.blue;

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
          SizedBox(height: 1.h),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: 1.w),

              Container(
                margin: EdgeInsets.only(top: 3.w),
                width: 7.6.w,
                height: 7.6.w,
                decoration: BoxDecoration(
                  color: iconColor.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(9),
                  border: Border.all(
                    color: iconColor.withValues(alpha: 0.4),
                    width: 1,
                  ),
                ),
                child: usesStarAsset
                    ? Padding(
                        padding: EdgeInsets.all(2.2.w),
                        child: Image.asset(
                          AppImage.starIcon,
                          color: iconColor,
                          height: 4.7.w,
                        ),
                      )
                    : Icon(Icons.star_rounded, size: 4.7.w, color: iconColor),
              ),

              SizedBox(width: 3.6.w),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title + Status
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible(
                          child: CustomText(
                            title,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),

                        SizedBox(width: 2.5.w),

                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 3.5.w,
                            vertical: 0.5.h,
                          ),
                          decoration: BoxDecoration(
                            color: statusColor.withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                isCompleted
                                    ? Icons.check_circle_outline
                                    : Icons.info_outline,
                                size: 4.w,
                                color: statusColor,
                              ),
                              SizedBox(width: 1.3.w),
                              CustomText(
                                isCompleted ? 'Completed' : 'Overdue',
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                                color: statusColor,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 0.6.h),

                    Row(
                      children: [
                        CustomText(
                          type,
                          fontSize: 13.8.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.white.withValues(alpha: 0.45),
                        ),
                        CustomText(
                          '  •  ',
                          fontSize: 13.3.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.white.withValues(alpha: 0.3),
                        ),
                        Expanded(
                          child: CustomText(
                            dateRange,
                            fontSize: 13.3.sp,
                            fontWeight: FontWeight.w500,
                            color: statusColor,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: 2.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Row(
              children: [
                SizedBox(
                  width: 35.w,
                  child: onTap(
                    onTap: onEditRestore,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 1.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: AppColors.white.withValues(alpha: 0.1),
                          width: 1,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.edit_outlined,
                            size: 5.w,
                            color: AppColors.white,
                          ),
                          SizedBox(width: 1.8.w),
                          CustomText(
                            'Edit / Restore',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                SizedBox(width: 3.w),

                onTap(
                  onTap: onDelete,
                  child: Container(
                    width: 9.w,
                    height: 9.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: AppColors.white.withValues(alpha: 0.1),
                        width: 1,
                      ),
                    ),
                    child: Icon(
                      Icons.delete_forever_outlined,
                      size: 4.2.w,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
