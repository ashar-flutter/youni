import '../../config/barrel.dart';

class ToDoList extends StatefulWidget {
  const ToDoList({super.key});

  @override
  State<ToDoList> createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  DateTime _displayedMonth = DateTime(2026, 6, 1);
  DateTime _selectedDate = DateTime(2026, 6, 3);

  static const List<String> _weekdayLabels = [
    'SUN',
    'MON',
    'TUE',
    'WED',
    'THU',
    'FRI',
    'SAT',
  ];

  static const List<String> _monthNames = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'June',
    'July',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];

  void _goToPreviousMonth() {
    setState(() {
      _displayedMonth = DateTime(
        _displayedMonth.year,
        _displayedMonth.month - 1,
        1,
      );
    });
  }

  void _goToNextMonth() {
    setState(() {
      _displayedMonth = DateTime(
        _displayedMonth.year,
        _displayedMonth.month + 1,
        1,
      );
    });
  }

  /// Memory efficient grid generator using fixed loop bounds
  List<_CalendarDay> _buildGridDays() {
    final int year = _displayedMonth.year;
    final int month = _displayedMonth.month;

    final DateTime firstOfMonth = DateTime(year, month, 1);
    final int daysInMonth = DateTime(year, month + 1, 0).day;
    final int daysInPrevMonth = DateTime(year, month, 0).day;

    final int leadingCount = firstOfMonth.weekday % 7;
    final List<_CalendarDay> days = List.generate(
      42,
      (_) => const _CalendarDay(date: null, isCurrentMonth: false),
    );

    int index = 0;

    // Previous Month Trailing Days
    for (int i = leadingCount - 1; i >= 0; i--) {
      days[index++] = _CalendarDay(
        date: DateTime(year, month - 1, daysInPrevMonth - i),
        isCurrentMonth: false,
      );
    }

    // Current Month Days
    for (int d = 1; d <= daysInMonth; d++) {
      days[index++] = _CalendarDay(
        date: DateTime(year, month, d),
        isCurrentMonth: true,
      );
    }

    // Next Month Leading Days
    int nextMonthDay = 1;
    while (index < 35 || (index > 35 && index < 42)) {
      days[index++] = _CalendarDay(
        date: DateTime(year, month + 1, nextMonthDay++),
        isCurrentMonth: false,
      );
    }

    return days.sublist(0, index);
  }

  bool _isSameDate(DateTime? a, DateTime b) {
    if (a == null) return false;
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  @override
  Widget build(BuildContext context) {
    final List<_CalendarDay> gridDays = _buildGridDays();
    final String currentMonthName = _monthNames[_displayedMonth.month - 1];

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          const MainAppBar(showPremiumAndFeatures: false),

          SizedBox(height: 3.h),

          const NewEntityRow(),

          SizedBox(height: 3.h),

          // Outer Card
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 5.w),
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.2.h),
            decoration: BoxDecoration(
              color: AppColors.greyDark.withValues(alpha: 0.67),
              borderRadius: BorderRadius.circular(22),
              border: Border.all(color: AppColors.greyDark, width: 1),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 1.2.h),
                // ── Header: Title, Subtitle, Close Icon, Add Task Button ──
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      AppImage.checkBoxIcon,
                      width: 5.5.w,
                      height: 5.5.w,
                      color: AppColors.blue,
                    ),
                    SizedBox(width: 2.5.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText('To Do List', fontWeight: FontWeight.w400),
                          SizedBox(height: 0.3.h),
                          CustomText(
                            'Manage your tasks and projects',
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.white.withValues(alpha: 0.8),
                          ),
                        ],
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(0, -1.5.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          // Close Icon
                          GestureDetector(
                            onTap: () {},
                            child: Padding(
                              padding: EdgeInsets.only(right: 0.5.w),
                              child: Icon(
                                Icons.close_rounded,
                                size: 4.5.w,
                                color: AppColors.white,
                              ),
                            ),
                          ),

                          // Vertical gap
                          SizedBox(height: 1.5.h),

                          // Add Task Button
                          onTap(
                            onTap: () {},
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 2.2.w,
                                vertical: 0.8.h,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.blue,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.add_rounded,
                                    size: 4.w,
                                    color: AppColors.white,
                                  ),
                                  SizedBox(width: 1.w),
                                  CustomText('Add Task', fontSize: 12.5.sp),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                // ── Horizontal Divider Line ──
                SizedBox(
                  height: 1,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        left: -4.w,
                        right: -4.w,
                        top: 0,
                        child: Container(
                          height: 1,
                          color: AppColors.white.withValues(alpha: 0.08),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 3.6.h),

                // ── Calendar Card Container with Internal Stack ──
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.deepNavy.withValues(alpha: 0.60),
                    borderRadius: BorderRadius.circular(22),
                    border: Border.all(
                      color: AppColors.calendarBorderBlue.withValues(
                        alpha: 0.20,
                      ),
                      width: 0.5,
                    ),
                  ),
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Positioned(
                        top: -0.5.h,
                        child: CustomPaint(
                          painter: _MonthArcPainter(
                            ringColor: AppColors.goldAccent,
                          ),
                          child: Container(
                            width: 22.w,
                            height: 22.w,
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: CustomText(
                                    currentMonthName,
                                    fontSize: 15.5.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(height: 0.3.h),
                                CustomText(
                                  '${_displayedMonth.year}',
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.blueSky,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      // Container Inner Content
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 3.w,
                          vertical: 2.h,
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 3.5.w,
                                vertical: 2.h,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  _NavArrowButton(
                                    icon: Icons.chevron_left_rounded,
                                    onTap: _goToPreviousMonth,
                                  ),
                                  SizedBox(width: 22.w),
                                  _NavArrowButton(
                                    icon: Icons.chevron_right_rounded,
                                    onTap: _goToNextMonth,
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(height: 4.2.h),

                            // Weekday Header Row
                            Row(
                              children: _weekdayLabels
                                  .map(
                                    (label) => Expanded(
                                      child: Center(
                                        child: CustomText(
                                          label,
                                          fontSize: 10.5.sp,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.gold,
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),

                            SizedBox(height: 1.5.h),

                            // Date Grid (7 columns per row)
                            for (
                              int rowStart = 0;
                              rowStart < gridDays.length;
                              rowStart += 7
                            )
                              Padding(
                                padding: EdgeInsets.only(bottom: 1.h),
                                child: Row(
                                  children: List.generate(7, (col) {
                                    if (rowStart + col >= gridDays.length) {
                                      return const Expanded(child: SizedBox());
                                    }
                                    final _CalendarDay day =
                                        gridDays[rowStart + col];
                                    final bool isSelected =
                                        day.isCurrentMonth &&
                                        _isSameDate(day.date, _selectedDate);

                                    return Expanded(
                                      child: Center(
                                        child: _DayCell(
                                          day: day,
                                          isSelected: isSelected,
                                          onTap: () {
                                            if (!day.isCurrentMonth ||
                                                day.date == null) {
                                              return;
                                            }
                                            setState(() {
                                              _selectedDate = day.date!;
                                            });
                                          },
                                        ),
                                      ),
                                    );
                                  }),
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
          ),

          // Extra bottom spacing for vertical scroll
          SizedBox(height: 8.h),
        ],
      ),
    );
  }
}

// Custom Painter for Double Circle with Cut Outer Arc at Bottom
class _MonthArcPainter extends CustomPainter {
  final Color ringColor;

  _MonthArcPainter({required this.ringColor});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);

    // Inner full circle
    final innerPaint = Paint()
      ..color = ringColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.2;

    canvas.drawCircle(center, size.width * 0.35, innerPaint);

    // Outer cut arc (Bottom left to bottom right missing)
    final outerPaint = Paint()
      ..color = ringColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    const double startAngle = 2.2;
    const double sweepAngle = 5.0;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: size.width * 0.51),
      startAngle,
      sweepAngle,
      false,
      outerPaint,
    );
  }

  @override
  bool shouldRepaint(covariant _MonthArcPainter oldDelegate) =>
      oldDelegate.ringColor != ringColor;
}

class _CalendarDay {
  final DateTime? date;
  final bool isCurrentMonth;

  const _CalendarDay({required this.date, required this.isCurrentMonth});
}

class _NavArrowButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _NavArrowButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 8.w,
        height: 8.w,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.red.withValues(alpha: 0.15),
          border: Border.all(
            color: AppColors.red.withValues(alpha: 0.5),
            width: 1,
          ),
        ),
        child: Icon(icon, size: 4.2.w, color: AppColors.red),
      ),
    );
  }
}

class _DayCell extends StatelessWidget {
  final _CalendarDay day;
  final bool isSelected;
  final VoidCallback onTap;

  const _DayCell({
    required this.day,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    if (day.date == null) return const SizedBox();

    final Color textColor = !day.isCurrentMonth
        ? AppColors.white.withValues(alpha: 0.2)
        : isSelected
        ? AppColors.white
        : AppColors.white.withValues(alpha: 0.85);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 8.5.w,
        height: 8.5.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected
              ? AppColors.red.withValues(alpha: 0.25)
              : Colors.transparent,
          border: isSelected
              ? Border.all(color: AppColors.red, width: 1.2)
              : null,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomText(
              '${day.date!.day}',
              fontSize: 12.sp,
              fontWeight: isSelected ? FontWeight.w700 : FontWeight.w400,
              color: textColor,
            ),
            if (isSelected)
              Container(
                margin: EdgeInsets.only(top: 0.2.h),
                width: 1.w,
                height: 1.w,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.gold,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
