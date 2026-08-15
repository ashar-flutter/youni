import '../../config/barrel.dart';

class TaskCardHeader extends StatelessWidget {
  final String iconPath;
  final Color accentColor;
  final Color fillColor;
  final Color? imageColor;
  final String title;
  final String subtitle;
  final Widget? trailing;
  final Widget? belowContent;

  const TaskCardHeader({
    super.key,
    required this.iconPath,
    required this.accentColor,
    required this.fillColor,
    this.imageColor,
    required this.title,
    required this.subtitle,
    this.trailing,
    this.belowContent,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 7.5.w,
              height: 7.5.w,
              decoration: BoxDecoration(
                color: fillColor,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: accentColor.withValues(alpha: 0.20),
                  width: 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: accentColor.withValues(alpha: 0.20),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.all(2.w),
                child: Image.asset(iconPath, color: imageColor),
              ),
            ),
            SizedBox(width: 3.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    title,
                    fontSize: 12.px,
                    fontWeight: FontWeight.w700,
                  ),
                  SizedBox(height: 0.3.h),
                  CustomText(
                    subtitle,
                    fontSize: 7.px,
                    fontWeight: FontWeight.w400,
                    color: AppColors.white.withValues(alpha: 0.6),
                  ),
                ],
              ),
            ),
            ?trailing,
          ],
        ),
        if (belowContent != null) ...[SizedBox(height: 2.h), belowContent!],
      ],
    );
  }
}

class TaskItemData {
  final String title;
  final String date;
  final String taskName;
  final String description;
  final bool isRecurring;

  const TaskItemData({
    required this.title,
    required this.date,
    required this.taskName,
    required this.description,
    required this.isRecurring,
  });
}

class TaskItemTile extends StatelessWidget {
  final TaskItemData data;
  final Color accentColor;
  final bool showLeadingCheck;
  final bool showMoveIcon;
  final bool isExpanded;
  final VoidCallback onToggle;

  final Color backgroundColor;
  final Color? borderColor;
  final double borderWidth;

  final Color buttonColor;
  final Color panelBorderColor;
  final Color textColor;

  const TaskItemTile({
    super.key,
    required this.data,
    required this.accentColor,
    required this.showLeadingCheck,
    required this.showMoveIcon,
    required this.isExpanded,
    required this.onToggle,
    this.backgroundColor = const Color(0xFF1B1D24),
    this.borderColor,
    this.borderWidth = 1,
    this.buttonColor = AppColors.blueOverlay,
    this.panelBorderColor = AppColors.blueOverlay,
    this.textColor = AppColors.lightBlueAcc,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 1.4.h),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
        border: borderColor != null
            ? Border.all(color: borderColor!, width: borderWidth)
            : null,
      ),
      child: Column(
        children: [
          onTap(
            onTap: onToggle,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.5.w, vertical: 1.6.h),
              child: Row(
                children: [
                  if (showLeadingCheck) ...[
                    Container(
                      width: 13.px,
                      height: 13.px,
                      decoration: BoxDecoration(
                        color: AppColors.green,
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: AppColors.deepNavy, width: 1),
                      ),
                      child: Icon(
                        Icons.check_rounded,
                        size: 8.px,
                        color: AppColors.white,
                      ),
                    ),
                    SizedBox(width: 2.8.w),
                  ],
                  Expanded(
                    child: CustomText(
                      data.title,
                      fontSize: 9.px,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Icon(
                    Icons.calendar_today_outlined,
                    size: 8.px,
                    color: AppColors.lightBlueAcc,
                  ),
                  SizedBox(width: 1.2.w),
                  CustomText(
                    data.date,
                    fontSize: 8.px,
                    fontWeight: FontWeight.w400,
                    color: AppColors.lightBlueAcc,
                  ),
                  SizedBox(width: 2.5.w),
                  Icon(Icons.delete_outline, size: 13.px, color: AppColors.red),
                  SizedBox(width: 2.5.w),
                  Icon(
                    Icons.check_circle_outline,
                    size: 10.px,
                    color: AppColors.white,
                  ),
                  if (showMoveIcon) ...[
                    SizedBox(width: 2.5.w),
                    Icon(
                      Icons.drive_file_move_outline,
                      size: 10.px,
                      color: AppColors.white,
                    ),
                  ],
                  SizedBox(width: 2.5.w),
                  AnimatedRotation(
                    turns: isExpanded ? 0.5 : 0,
                    duration: const Duration(milliseconds: 200),
                    child: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      size: 11.px,
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          AnimatedSize(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            child: isExpanded
                ? Padding(
              padding: EdgeInsets.fromLTRB(3.5.w, 0, 3.5.w, 2.h),
              child: _TaskDetailPanel(
                data: data,
                accentColor: accentColor,
                buttonColor: buttonColor,
                borderColor: panelBorderColor,
                textColor: textColor,
              ),
            )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}

class _TaskDetailPanel extends StatelessWidget {
  final TaskItemData data;
  final Color accentColor;

  final Color buttonColor;
  final Color borderColor;
  final Color textColor;

  const _TaskDetailPanel({
    required this.data,
    required this.accentColor,
    required this.buttonColor,
    required this.borderColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          height: 1,
          color: AppColors.white.withValues(alpha: 0.08),
        ),
        SizedBox(height: 1.8.h),

        Row(
          children: [
            Icon(
              Icons.outlined_flag,
              size: 12.px,
              color: AppColors.white.withValues(alpha: 0.60),
            ),
            SizedBox(width: 1.5.w),
            CustomText(
              'TASK DETAILS',
              fontSize: 9.px,
              color: AppColors.white.withValues(alpha: 0.60),
            ),
          ],
        ),
        SizedBox(height: 2.h),

        AppTextField(
          labelColor: AppColors.white.withValues(alpha: 0.60),
          labelGap: 1.2.h,
          fillColor: AppColors.blackOverlay,
          borderColor: AppColors.white.withValues(alpha: 0.05),
          labelText: 'Task Name',
          hintText: data.taskName,
          height: 32.px,
          labelSize: 9.px,
          hintSize: 10.px,
          textSize: 10.px,
          hintColor: AppColors.white.withValues(alpha: 0.70),
          borderRadius: 10,
          contentPadding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
        ),
        SizedBox(height: 1.4.h),

        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              flex: 2,
              child: AppTextField(
                labelColor: AppColors.white.withValues(alpha: 0.60),
                labelGap: 1.2.h,
                borderColor: AppColors.white.withValues(alpha: 0.05),
                fillColor: AppColors.blackOverlay,
                labelText: 'Description',
                hintText: data.description,
                height: 32.px,
                labelSize: 9.px,
                hintSize: 10.px,
                textSize: 10.px,
                hintColor: AppColors.white.withValues(alpha: 0.70),
                borderRadius: 10,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 3.w,
                  vertical: 1.h,
                ),
              ),
            ),
            SizedBox(width: 2.5.w),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    'Recurring Task',
                    fontSize: 9.px,
                    fontWeight: FontWeight.w400,
                    color: AppColors.white.withValues(alpha: 0.60),
                  ),
                  SizedBox(height: 1.2.h),
                  Container(
                    margin: EdgeInsets.only(bottom: 2.px),
                    width: double.infinity,
                    height: 29.px,
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(horizontal: 3.w),
                    decoration: BoxDecoration(
                      color: buttonColor.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: borderColor.withValues(alpha: 0.25),
                        width: 0.9,
                      ),
                    ),
                    child: CustomText(
                      data.isRecurring ? 'Yes' : 'No',
                      fontSize: 10.px,
                      color: textColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 2.2.h),

        Container(
          width: double.infinity,
          height: 1,
          color: AppColors.white.withValues(alpha: 0.08),
        ),
        SizedBox(height: 1.8.h),

        Row(
          children: [
            Image.asset(
              AppImage.activeIcon,
              height: 10.px,
              width: 10.px,
              color: AppColors.white.withValues(alpha: 0.60),
            ),
            SizedBox(width: 1.5.w),
            CustomText(
              'QUICK ACTIONS',
              fontSize: 9.px,
              letterSpacing: 0.6,
              color: AppColors.white.withValues(alpha: 0.60),
            ),
          ],
        ),
        SizedBox(height: 1.9.h),

        Wrap(
          spacing: 2.5.w,
          runSpacing: 1.4.h,
          children: [
            _QuickActionButton(
              icon: Icons.edit_note_rounded,
              label: 'Edit Task',
              onTap: () {},
            ),
            _QuickActionButton(
              icon: Icons.drive_file_move_outline,
              label: 'Move to Entity',
              onTap: () {
                SelectTargetEntityDialog.show(context);
              },
            ),
            _QuickActionButton(
              icon: Icons.check_circle_outline,
              label: 'Complete',
              onTap: () {},
            ),
          ],
        ),
      ],
    );
  }
}

class _QuickActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _QuickActionButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 0.8.h),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 12.px, color: AppColors.darkBlack),
            SizedBox(width: 1.3.w),
            CustomText(
              label,
              fontSize: 9.px,
              color: AppColors.darkBlack,
            ),
          ],
        ),
      ),
    );
  }
}