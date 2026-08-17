import '../../../config/barrel.dart';

class ToDoListTabView extends StatelessWidget {
  final bool isSelectionMode;

  const ToDoListTabView({
    super.key,
    this.isSelectionMode = false,
  });

  @override
  Widget build(BuildContext context) {
    final List<String> sampleTasks = ['Development Phase', 'Kitchen'];

    return Column(
      children: [
        SizedBox(height: 0.5.h),

        // Add Task Input Row
        Row(
          children: [
            Expanded(
              child: AppTextField(
                borderColor: Colors.transparent,
                fillColor: AppColors.greyDark,
                height: 40.px,
                hintText: 'Add a new task...',
                hintColor: AppColors.white.withValues(alpha: 0.40),
                hintSize: 12.px,
                textSize: 12.px,
              ),
            ),
            SizedBox(width: 2.5.w),
            Container(
              width: 40.px,
              height: 40.px,
              decoration: BoxDecoration(
                color: AppColors.blue,
                borderRadius: BorderRadius.circular(12.px),
              ),
              child: Icon(Icons.add, color: AppColors.white, size: 15.px),
            ),
          ],
        ),

        if (isSelectionMode) ...[
          SizedBox(height: 2.5.h),

          // List of Tasks
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: sampleTasks.length,
            separatorBuilder: (context, index) => SizedBox(height: 1.8.h),
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 14.px,
                  vertical: 8.px,
                ),
                decoration: BoxDecoration(
                  color: AppColors.greyDark,
                  borderRadius: BorderRadius.circular(14.px),
                ),
                child: Row(
                  children: [
                    // Unchecked Circle Icon
                    Container(
                      width: 15.px,
                      height: 15.px,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.white.withValues(alpha: 0.50),
                          width: 1.2.px,
                        ),
                      ),
                    ),
                    SizedBox(width: 12.px),

                    // Task Title
                    Expanded(
                      child: CustomText(
                        sampleTasks[index],
                        fontSize: 11.px,
                        fontWeight: FontWeight.w400,
                      ),
                    ),

                    // Edit Button
                    _buildCircleActionButton(
                      icon: Icons.edit_outlined,
                      onTap: () {},
                    ),
                    SizedBox(width: 5.px),

                    // Delete Button
                    _buildCircleActionButton(
                      icon: Icons.delete_outline_rounded,
                      onTap: () {},
                    ),
                  ],
                ),
              );
            },
          ),

        Container(height: 28.h,)
        ]
        // NORMAL MODE: Empty State
        else ...[
          SizedBox(height: 15.h),

          // Image Icon implementation from AppImage
          Image.asset(
            AppImage.checkBoxIcon,
            width: 45.px,
            height: 45.px,
            color: AppColors.white.withValues(alpha: 0.25),
            errorBuilder: (_, _, _) => Icon(
              Icons.check_box_outlined,
              size: 38.px,
              color: AppColors.white.withValues(alpha: 0.25),
            ),
          ),
          SizedBox(height: 1.5.h),

          CustomText(
            'To do list is empty',
            fontSize: 13.px,
            color: AppColors.white.withValues(alpha: 0.40),
          ),

          SizedBox(height: 18.h),
        ],
      ],
    );
  }

  // Circular Action Icon Helper
  Widget _buildCircleActionButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(6.px),
        decoration: BoxDecoration(
          color: AppColors.white.withValues(alpha: 0.08),
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          size: 12.px,
          color: AppColors.white.withValues(alpha: 0.65),
        ),
      ),
    );
  }
}