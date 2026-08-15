import '../../../config/barrel.dart';

class SelectTargetEntityDialog extends StatefulWidget {
  const SelectTargetEntityDialog({super.key});

  static Future<void> show(BuildContext context) {
    return showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: '',
      barrierColor: Colors.black.withValues(alpha: 0.65),
      transitionDuration: const Duration(milliseconds: 280),
      pageBuilder: (context, animation, secondaryAnimation) {
        return const SelectTargetEntityDialog();
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        final curved = CurvedAnimation(
          parent: animation,
          curve: Curves.easeOutCubic,
        );
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, 0.08),
            end: Offset.zero,
          ).animate(curved),
          child: FadeTransition(opacity: curved, child: child),
        );
      },
    );
  }

  @override
  State<SelectTargetEntityDialog> createState() =>
      _SelectTargetEntityDialogState();
}

class _EntityItemData {
  final String label;
  final IconData icon;
  final Color iconColor;
  final bool isBold;
  final bool isChild;

  const _EntityItemData({
    required this.label,
    required this.icon,
    required this.iconColor,
    this.isBold = false,
    this.isChild = false,
  });
}

class _SelectTargetEntityDialogState extends State<SelectTargetEntityDialog> {
  static const List<_EntityItemData> _items = [
    // Project Alpha & Children
    _EntityItemData(
      label: 'Project Alpha',
      icon: Icons.star_border_rounded,
      iconColor: AppColors.gold,
      isBold: true,
    ),
    _EntityItemData(
      label: 'Development Phase',
      icon: Icons.language,
      iconColor: AppColors.blueBright,
      isChild: true,
    ),
    _EntityItemData(
      label: 'Frontend',
      icon: Icons.language,
      iconColor: AppColors.blueBright,
      isChild: true,
    ),
    _EntityItemData(
      label: 'UI Components',
      icon: Icons.nightlight_round_outlined,
      iconColor: AppColors.blueGrey,
      isChild: true,
    ),
    _EntityItemData(
      label: 'Backend',
      icon: Icons.nightlight_round_outlined,
      iconColor: AppColors.blueGrey,
      isChild: true,
    ),
    _EntityItemData(
      label: 'Design Phase',
      icon: Icons.checklist_rtl_rounded,
      iconColor: AppColors.blueGrey,
      isChild: true,
    ),

    // Project Beta & Children
    _EntityItemData(
      label: 'Project Beta',
      icon: Icons.star_border_rounded,
      iconColor: AppColors.gold,
      isBold: true,
    ),
    _EntityItemData(
      label: 'Beta Sub-Project',
      icon: Icons.language,
      iconColor: AppColors.blueBright,
      isChild: true,
    ),
    _EntityItemData(
      label: 'Core Task',
      icon: Icons.nightlight_round_outlined,
      iconColor: AppColors.blueGrey,
      isChild: true,
    ),
    _EntityItemData(
      label: 'Sub-task Implementation',
      icon: Icons.checklist_rtl_rounded,
      iconColor: AppColors.blueGrey,
      isChild: true,
    ),
    _EntityItemData(
      label: 'Sub-task Testing',
      icon: Icons.checklist_rtl_rounded,
      iconColor: AppColors.blueGrey,
      isChild: true,
    ),

    // Standalone
    _EntityItemData(
      label: 'Personal Goal',
      icon: Icons.auto_awesome,
      iconColor: AppColors.purple,
      isBold: true,
    ),
    _EntityItemData(
      label: 'Morning Routine',
      icon: Icons.auto_awesome,
      iconColor: AppColors.purple,
      isBold: true,
    ),
  ];

  String? _selectedEntity;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(horizontal: 11.w, vertical: 24.px),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.fromLTRB(18.px, 18.px, 18.px, 16.px),
        decoration: BoxDecoration(
          color: AppColors.charcoal,
          borderRadius: BorderRadius.circular(26),
          border: Border.all(
            color: AppColors.greyDark.withValues(alpha: 0.8),
            width: 3,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Custom Header with Close Icon
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        'Select Target Entity',
                        fontSize: 14.px,
                        fontWeight: FontWeight.w700,
                      ),
                      SizedBox(height: 4.px),
                      CustomText(
                        'Choose where you want to save this task.',
                        fontSize: 10.px,
                        fontWeight: FontWeight.w400,
                        color: AppColors.white.withValues(alpha: 0.50),
                      ),
                      SizedBox(height: 1.6.h),
                      SizedBox(
                        height: 1.2.px,
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Positioned(
                              left: -18.px,
                              right: -33.px,
                              top: 0,
                              child: Container(
                                height: 1.2.px,
                                color: AppColors.greyDark,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                onTap(
                  onTap: () => Get.back(),
                  child: Icon(
                    Icons.close_rounded,
                    size: 16.px,
                    color: AppColors.white.withValues(alpha: 0.6),
                  ),
                ),
              ],
            ),

            SizedBox(height: 1.5.h),

            // Scrollable List
            ConstrainedBox(
              constraints: BoxConstraints(maxHeight: 52.h),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (final item in _items)
                      _EntityRow(
                        data: item,
                        isSelected: _selectedEntity == item.label,
                        onTap: () {
                          setState(() => _selectedEntity = item.label);
                        },
                      ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 18.px),

            // Action Buttons
            Row(
              children: [
                Expanded(
                  child: AppButton(
                    height: 40.px,
                    text: 'Save to Entity',
                    fontSize: 11.px,
                    backgroundColor: AppColors.blue,
                    borderRadius: 14,
                    onPressed: () => Get.back(),
                  ),
                ),
                SizedBox(width: 10.px),
                Expanded(
                  child: AppButton(
                    height: 40.px,
                    text: 'Cancel',
                    fontSize: 11.px,
                    backgroundColor: AppColors.white,
                    textColor: AppColors.dark,
                    borderRadius: 14,
                    onPressed: () => Get.back(),
                  ),
                ),
              ],
            ),
            SizedBox(height: 1.2.h),
          ],
        ),
      ),
    );
  }
}

class _EntityRow extends StatelessWidget {
  final _EntityItemData data;
  final bool isSelected;
  final VoidCallback onTap;

  const _EntityRow({
    required this.data,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(left: data.isChild ? 20.px : 0, bottom: 2.px),
        padding: EdgeInsets.symmetric(horizontal: 8.px, vertical: 10.3.px),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.blue.withValues(alpha: 0.15)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Icon(data.icon, size: 14.px, color: data.iconColor),
            SizedBox(width: 10.px),
            Expanded(
              child: CustomText(
                data.label,
                fontSize: data.isChild ? 11.5.px : 12.5.px,
                fontWeight: data.isBold ? FontWeight.w600 : FontWeight.w400,
                color: data.isChild
                    ? AppColors.white.withValues(alpha: 0.75)
                    : AppColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
