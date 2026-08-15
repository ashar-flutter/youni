import '../../config/barrel.dart';

class RecurringCard extends StatefulWidget {
  const RecurringCard({super.key});

  @override
  State<RecurringCard> createState() => _RecurringCardState();
}

class _RecurringCardState extends State<RecurringCard> {
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
  ];

  late final List<bool> _expanded;

  @override
  void initState() {
    super.initState();
    _expanded = List<bool>.filled(_items.length, false);
  }

  @override
  Widget build(BuildContext context) {
    const Color accent = AppColors.lightPurple;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 3.5.w, vertical: 2.h),
      decoration: BoxDecoration(
        color: AppColors.purpleOverLay.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: AppColors.purpleOverLay.withValues(alpha: 0.20),
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
            fillColor: AppColors.purpleOverLay.withValues(alpha: 0.10),
            iconPath: AppImage.recurringIcon,
            accentColor: accent,
            title: 'Recurring',
            subtitle: 'REPEATING GOALS',
          ),

          SizedBox(height: 2.h),

          for (int i = 0; i < _items.length; i++)
            TaskItemTile(
              backgroundColor: AppColors.blackOverlay,
              borderColor: AppColors.white.withValues(alpha: 0.05),
              buttonColor: AppColors.purpleOverLay,
              panelBorderColor: AppColors.purpleOverLay,
              textColor: AppColors.purpleOverLay.withValues(alpha: 0.90),
              data: _items[i],
              accentColor: accent,
              showLeadingCheck: true,
              showMoveIcon: false,
              isExpanded: _expanded[i],
              onToggle: () => setState(() => _expanded[i] = !_expanded[i]),
            ),
        ],
      ),
    );
  }
}