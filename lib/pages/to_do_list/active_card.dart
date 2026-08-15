import '../../config/barrel.dart';

class ActiveCard extends StatefulWidget {
  const ActiveCard({super.key});

  @override
  State<ActiveCard> createState() => _ActiveCardState();
}

class _ActiveCardState extends State<ActiveCard> {
  static const List<TaskItemData> _items = [
    TaskItemData(
      title: 'Development Phase',
      date: 'Jun 7',
      taskName: 'Development Phase',
      description: 'Description',
      isRecurring: true,
    ),
    TaskItemData(
      title: 'Frontend',
      date: 'Jun 7',
      taskName: 'Frontend',
      description: 'Description',
      isRecurring: true,
    ),
    TaskItemData(
      title: 'UI Components',
      date: 'Jun 7',
      taskName: 'UI Components',
      description: 'Description',
      isRecurring: true,
    ),
    TaskItemData(
      title: 'Backend',
      date: 'Jun 7',
      taskName: 'Backend',
      description: 'Description',
      isRecurring: true,
    ),
    TaskItemData(
      title: 'Design Phase',
      date: 'Jun 7',
      taskName: 'Design Phase',
      description: 'Description',
      isRecurring: true,
    ),
    TaskItemData(
      title: 'Project Beta',
      date: 'Jun 7',
      taskName: 'Profession',
      description: 'Description',
      isRecurring: true,
    ),
    TaskItemData(
      title: 'Beta Sub-Project',
      date: 'Jun 7',
      taskName: 'Profession',
      description: 'Description',
      isRecurring: true,
    ),
  ];

  late final List<bool> _expanded;

  @override
  void initState() {
    super.initState();
    _expanded = List<bool>.filled(_items.length, false);
  }

  @override
  Widget build(BuildContext context) {
    const Color accent = AppColors.blueOverlay;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 3.5.w, vertical: 2.h),
      decoration: BoxDecoration(
        color: AppColors.blueOverlay.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: AppColors.blueOverlay.withValues(alpha: 0.20),
          width: 1.2,
        ),
        boxShadow: [
          BoxShadow(
            color: accent.withValues(alpha: 0.08),
            blurRadius: 16,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TaskCardHeader(
            iconPath: AppImage.activeIcon,
            accentColor: accent,
            title: 'Active Tasks',
            subtitle: 'CURRENT FOCUS & ACTION ITEMS',
            trailing: onTap(
              onTap: () {
                AddNewTaskDialog.show(context);
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 0.9.h),
                decoration: BoxDecoration(
                  color: AppColors.blue,
                  borderRadius: BorderRadius.circular(9),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.add_rounded,
                      size: 3.8.w,
                      color: AppColors.white,
                    ),
                    SizedBox(width: 0.8.w),
                    CustomText(
                      'Add Task',
                      fontSize: 7.px,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
              ),
            ),
            belowContent: Align(
              alignment: Alignment.centerRight,
              child: FractionallySizedBox(
                widthFactor: 0.58,
                child: AppTextField(
                  readOnly: true,
                  onTap: () {
                    final ui = Get.find<UiController>();
                    ui.navigate('todo', 0);
                  },
                  focusBorderColor: Colors.transparent,
                  borderColor: AppColors.white.withValues(alpha: 0.10),
                  hintText: 'Search a task by date',
                  height: 25.px,
                  hintSize: 10.px,
                  textSize: 11.px,
                  hintColor: AppColors.white.withValues(alpha: 0.60),
                  borderRadius: 30.px,
                  fillColor: AppColors.white.withValues(alpha: 0.05),
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(left: 8.px),
                    child: Icon(
                      Icons.search,
                      size: 14.px,
                      color: AppColors.white,
                    ),
                  ),
                  prefixIconConstraints: BoxConstraints(
                    minWidth: 26.px,
                    minHeight: 32.px,
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 0,
                    vertical: 0,
                  ),
                ),
              ),
            ),
            fillColor: AppColors.blueOverlay.withValues(alpha: 0.10),
          ),
          SizedBox(height: 2.h),

          for (int i = 0; i < _items.length; i++)
            TaskItemTile(
              backgroundColor: AppColors.blackOverlay,
              borderColor: AppColors.white.withValues(alpha: 0.05),
              data: _items[i],
              accentColor: accent,
              showLeadingCheck: false,
              showMoveIcon: true,
              isExpanded: _expanded[i],
              onToggle: () => setState(() => _expanded[i] = !_expanded[i]),
            ),
        ],
      ),
    );
  }
}
