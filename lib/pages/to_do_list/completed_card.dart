import '../../config/barrel.dart';

class CompletedCard extends StatefulWidget {
  const CompletedCard({super.key});

  @override
  State<CompletedCard> createState() => _CompletedCardState();
}

class _CompletedCardState extends State<CompletedCard> {
  static const List<TaskItemData> _items = [
    TaskItemData(
      title: 'Development Phase',
      date: 'Jun 7',
      taskName: 'Development Phase',
      description: 'Description',
      isRecurring: false,
    ),
    TaskItemData(
      title: 'Frontend',
      date: 'Jun 7',
      taskName: 'Frontend',
      description: 'Description',
      isRecurring: false,
    ),
    TaskItemData(
      title: 'UI Components',
      date: 'Jun 7',
      taskName: 'UI Components',
      description: 'Description',
      isRecurring: false,
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
    const Color accent = AppColors.greenAccent;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 3.5.w, vertical: 2.h),
      decoration: BoxDecoration(
        color: AppColors.greenOverlay.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: AppColors.greenOverlay.withValues(alpha: 0.20),
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
            iconPath: AppImage.completedIcon,
            accentColor: accent,
            title: 'Completed',
            subtitle: 'HISTORY',
            fillColor: AppColors.greenOverlay.withValues(alpha: 0.10),
          ),

          SizedBox(height: 2.h),

          for (int i = 0; i < _items.length; i++)

            TaskItemTile(
              backgroundColor: AppColors.blackOverlay,
              buttonColor: AppColors.greenOverlay,
              panelBorderColor: AppColors.greenOverlay,
              textColor: AppColors.greenOverlay.withValues(alpha: 0.90),
              borderColor: AppColors.white.withValues(alpha: 0.05),
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
