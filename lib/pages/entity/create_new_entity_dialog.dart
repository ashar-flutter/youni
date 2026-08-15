import '../../../config/barrel.dart';

class CreateNewEntityDialog extends StatefulWidget {
  const CreateNewEntityDialog({super.key});

  static Future<void> show(BuildContext context) {
    return showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: '',
      barrierColor: Colors.black.withValues(alpha: 0.60),
      transitionDuration: const Duration(milliseconds: 280),
      pageBuilder: (context, animation, secondaryAnimation) {
        return const CreateNewEntityDialog();
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

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(
        horizontal: 9.w,
        vertical: 2.h,
      ),
      child: Center(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            width: 90.w,
            decoration: BoxDecoration(
              color: AppColors.blueOverlay.withValues(alpha: 0.10),
              borderRadius: BorderRadius.circular(26),
              border: Border.all(
                color: AppColors.charcoal,
                width: 2,
              ),
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
                              'Create New Entity',
                              fontSize: 14.px,
                            ),
                            SizedBox(height: 0.4.h),
                            CustomText(
                              'Create a new star (project) or comet (personal item)',
                              fontSize: 12.px,
                              fontWeight: FontWeight.w400,
                              color: AppColors.white.withValues(alpha: 0.50),
                            ),
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

             SizedBox(height: 1.h,),

                // Horizontal Tab Bar
                _CustomEntityTabBar(
                  selectedTab: _selectedTab,
                  onTabChanged: (tab) => setState(() => _selectedTab = tab),
                ),

                SizedBox(height: 1.8.h),

                // Tab Content Area
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: _buildSelectedTabContent(),
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
                          text: 'Create Entity',
                          fontSize: 14.sp,
                          backgroundColor: AppColors.blue,
                          textColor: AppColors.white,
                          borderRadius: 14,
                          onPressed: () {},
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
                SizedBox(height: 1.h,),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSelectedTabContent() {
    switch (_selectedTab) {
      case EntityTabType.general:
        return const GeneralTabView();
      case EntityTabType.timeline:
        return const TimelineTabView();
      case EntityTabType.media:
        return const MediaTabView();
      case EntityTabType.notes:
        return const NotesTabView();
      case EntityTabType.toDoList:
        return const ToDoListTabView();
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
      color: const Color(0xFF2B2C30),
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

    return GestureDetector(
      onTap: () => onTabChanged(type),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        margin: EdgeInsets.only(right: 2.w),
        padding: EdgeInsets.symmetric(horizontal: 12.px, vertical: 6.px),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.white.withValues(alpha: 0.15)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(8.px),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 14.px,
              color: isSelected
                  ? AppColors.white
                  : AppColors.white.withValues(alpha: 0.45),
            ),
            SizedBox(width: 6.px),
            CustomText(
              title,
              fontSize: 12.5.px,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
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