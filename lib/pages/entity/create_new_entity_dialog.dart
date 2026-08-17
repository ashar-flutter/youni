import '../../../config/barrel.dart';

class CreateNewEntityDialog extends StatefulWidget {
  final String? title;

  const CreateNewEntityDialog({super.key, this.title});

  static Future<void> show(BuildContext context, {String? title}) {
    return Get.generalDialog(
      barrierDismissible: true,
      barrierLabel: '',
      barrierColor: Colors.black.withValues(alpha: 0.60),
      transitionDuration: const Duration(milliseconds: 280),
      pageBuilder: (context, animation, secondaryAnimation) {
        return CreateNewEntityDialog(title: title);
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
  State<CreateNewEntityDialog> createState() => _CreateNewEntityDialogState();
}

enum EntityTabType { general, timeline, media, notes, toDoList }

class _CreateNewEntityDialogState extends State<CreateNewEntityDialog> {
  EntityTabType _selectedTab = EntityTabType.general;
  bool _showDeleteMenu = false;

  @override
  Widget build(BuildContext context) {
    final bool isSelectionMode = widget.title != null;

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(horizontal: 9.w, vertical: 2.h),
      child: Center(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            width: 90.w,
            decoration: BoxDecoration(
              color: AppColors.charcoal.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(26),
              border: Border.all(color: AppColors.greyDark, width: 2),
              boxShadow: [
                BoxShadow(
                  color: AppColors.black.withValues(alpha: 0.10),
                  offset: const Offset(0, 4),
                  blurRadius: 6,
                  spreadRadius: -4,
                ),
                BoxShadow(
                  color: AppColors.black.withValues(alpha: 0.10),
                  offset: const Offset(0, 10),
                  blurRadius: 15,
                  spreadRadius: -3,
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Header
                Padding(
                  padding: EdgeInsets.only(
                    left: 5.w,
                    right: 5.w,
                    top: 2.h,
                    bottom: 1.5.h,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              widget.title ?? 'Create New Entity',
                              fontSize: 13.px,
                            ),

                            // Subtitle ONLY in normal mode
                            if (!isSelectionMode) ...[
                              SizedBox(height: 0.4.h),
                              CustomText(
                                'Create a new star (project) or comet (personal item)',
                                fontSize: 8.5.px,
                                fontWeight: FontWeight.w400,
                                color: AppColors.white.withValues(alpha: 0.70),
                                maxLines: 1,
                              ),
                            ],
                          ],
                        ),
                      ),

                      SizedBox(width: 2.w),

                      onTap(
                        onTap: () => Get.back(),
                        child: Padding(
                          padding: EdgeInsets.only(top: 2.px),
                          child: Icon(
                            Icons.close_rounded,
                            size: 18.px,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Divider line below header
                Divider(
                  color: AppColors.white.withValues(alpha: 0.12),
                  height: 1.px,
                  thickness: 1.px,
                ),

                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // 3-Dots Button (Only in selection mode)
                        if (isSelectionMode) ...[
                          SizedBox(height: 0.8.h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5.w),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: onTap(
                                onTap: () {
                                  setState(() {
                                    _showDeleteMenu = !_showDeleteMenu;
                                  });
                                },
                                child: Container(
                                  width: 17.px,
                                  height: 24.px,
                                  decoration: BoxDecoration(
                                    color: AppColors.charcoal.withValues(
                                      alpha: 0.80,
                                    ),
                                    borderRadius: BorderRadius.circular(4.px),
                                  ),
                                  child: Icon(
                                    Icons.more_vert_rounded,
                                    size: 14.px,
                                    color: AppColors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 0.8.h),
                        ],

                        // Horizontal Tab Bar
                        _CustomEntityTabBar(
                          selectedTab: _selectedTab,
                          onTabChanged: (tab) {
                            setState(() {
                              _selectedTab = tab;
                              _showDeleteMenu = false;
                            });
                          },
                        ),
                      ],
                    ),

                    // Delete Popup Menu (Floating OVER the TabBar)
                    if (_showDeleteMenu && isSelectionMode)
                      Positioned(
                        right: 8.w,
                        top: 28.px,
                        child: onTap(
                          onTap: () {
                            setState(() => _showDeleteMenu = false);

                            // Call Delete Entity Dialog
                            DeleteEntityDialog.show(onConfirm: () {});
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8.px,
                              vertical: 6.px,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.charcoal,
                              borderRadius: BorderRadius.circular(9.px),
                              border: Border.all(
                                color: AppColors.white.withValues(alpha: 0.20),
                                width: 1.px,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.black.withValues(
                                    alpha: 0.50,
                                  ),
                                  blurRadius: 14.px,
                                  spreadRadius: 1.px,
                                  offset: Offset(0, 6.px),
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.delete_outline_rounded,
                                  size: 13.px,
                                  color: AppColors.white,
                                ),
                                SizedBox(width: 4.px),
                                CustomText(
                                  'Delete',
                                  fontSize: 10.px,
                                  color: AppColors.red,
                                  fontWeight: FontWeight.w500,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                  ],
                ),

                SizedBox(height: 1.8.h),

                // Tab Content Area
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: _buildSelectedTabContent(isSelectionMode),
                ),

                SizedBox(height: 2.h),

                // Action Buttons
                Padding(
                  padding: EdgeInsets.only(
                    left: 5.w,
                    right: 5.w,
                    bottom: 2.5.h,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: AppButton(
                          height: 40.px,
                          text: isSelectionMode ? 'Save' : 'Create Entity',
                          fontSize: 14.sp,
                          backgroundColor: AppColors.blue,
                          textColor: AppColors.white,
                          borderRadius: 14,
                          onPressed: () {
                            Get.back();

                            // Navigation ONLY in Normal Mode
                            if (!isSelectionMode) {
                              Future.delayed(const Duration(seconds: 1), () {
                                EntitySelectionBox.show();
                              });
                            }
                          },
                        ),
                      ),

                      SizedBox(width: 3.w),

                      Expanded(
                        child: AppButton(
                          height: 40.px,
                          text: 'Cancel',
                          fontSize: 14.sp,
                          backgroundColor: AppColors.white,
                          textColor: AppColors.dark,
                          borderRadius: 14,
                          onPressed: () => Get.back(),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 1.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSelectedTabContent(bool isSelectionMode) {
    switch (_selectedTab) {
      case EntityTabType.general:
        return GeneralTabView(isSelectionMode: isSelectionMode);

      case EntityTabType.timeline:
        return TimelineTabView(isSelectionMode: isSelectionMode);

      case EntityTabType.media:
        return MediaTabView(isSelectionMode: isSelectionMode);

      case EntityTabType.notes:
        return NotesTabView(isSelectionMode: isSelectionMode);

      case EntityTabType.toDoList:
        return ToDoListTabView(isSelectionMode: isSelectionMode);
    }
  }
}

class _CustomEntityTabBar extends StatelessWidget {
  final EntityTabType selectedTab;
  final ValueChanged<EntityTabType> onTabChanged;

  const _CustomEntityTabBar({
    required this.selectedTab,
    required this.onTabChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 42.px,
      color: AppColors.greyDarkLight,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 4.px),
        child: Row(
          children: [
            _buildTabItem(
              type: EntityTabType.general,
              title: 'General',
              icon: Icons.info_outline_rounded,
            ),
            _buildTabItem(
              type: EntityTabType.timeline,
              title: 'Timeline',
              icon: Icons.access_time_rounded,
            ),
            _buildTabItem(
              type: EntityTabType.media,
              title: 'Media',
              icon: Icons.attach_file_rounded,
            ),
            _buildTabItem(
              type: EntityTabType.notes,
              title: 'Notes',
              icon: Icons.access_time_rounded,
            ),
            _buildTabItem(
              type: EntityTabType.toDoList,
              title: 'To Do List',
              icon: Icons.check_box_outlined,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabItem({
    required EntityTabType type,
    required String title,
    required IconData icon,
  }) {
    final bool isSelected = selectedTab == type;

    return onTap(
      onTap: () => onTabChanged(type),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        margin: EdgeInsets.only(right: 2.w),
        padding: EdgeInsets.symmetric(horizontal: 11.6.px, vertical: 5.px),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.charcoal : Colors.transparent,
          borderRadius: BorderRadius.circular(8.px),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 13.px,
              color: isSelected
                  ? AppColors.white
                  : AppColors.white.withValues(alpha: 0.45),
            ),
            SizedBox(width: 4.px),
            CustomText(
              title,
              fontSize: 12.px,
              fontWeight: FontWeight.w400,
              color: isSelected
                  ? AppColors.white
                  : AppColors.white.withValues(alpha: 0.45),
            ),
          ],
        ),
      ),
    );
  }
}
