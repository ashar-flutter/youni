import '../../config/barrel.dart';

class OrbitLegend extends StatelessWidget {
  const OrbitLegend({super.key});

  static const List<OrbitStatus> _entries = [
    OrbitStatus.notStarted,
    OrbitStatus.inProgress,
    OrbitStatus.personnelEvent,
    OrbitStatus.dedicatedSpot,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 3.w),
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
      decoration: BoxDecoration(
        color: AppColors.darkBackground.withValues(alpha: 0.85),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: AppColors.white.withValues(alpha: 0.08),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (int i = 0; i < _entries.length; i++)
            Padding(
              padding: EdgeInsets.only(bottom: i == _entries.length - 1 ? 0 : 1.5.h),
              child: Row(
                children: [
                  Container(
                    width: 3.3.w,
                    height: 3.3.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _entries[i].color,
                    ),
                  ),
                  SizedBox(width: 2.5.w),
                  CustomText(
                    _entries[i].label,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.white.withValues(alpha: 0.85),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class UniverseTimeRangeTabBar extends StatelessWidget {
  final String selected;
  final ValueChanged<String> onChanged;

  const UniverseTimeRangeTabBar({
    super.key,
    required this.selected,
    required this.onChanged,
  });

  static const List<String> _options = ['Day', 'Month', 'Year', '4 Years'];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(1.w),
      decoration: BoxDecoration(
        color: AppColors.greyDark.withValues(alpha: 0.7),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: _options.map((option) {
          final bool isSelected = option == selected;
          return Expanded(
            child: onTap(
              onTap: () => onChanged(option),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: EdgeInsets.symmetric(vertical: 1.4.h),
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.blue : Colors.transparent,
                  borderRadius: BorderRadius.circular(11),
                ),
                child: Center(
                  child: CustomText(
                    option,
                    fontSize: 13.sp,
                    fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                    color: isSelected
                        ? AppColors.white
                        : AppColors.white.withValues(alpha: 0.4),
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

/// Owns the selected time-range and rebuilds ONLY the diagram+tabs
/// subtree — the rest of Universe stays untouched.
class UniverseOrbitSection extends StatefulWidget {
  const UniverseOrbitSection({super.key});

  @override
  State<UniverseOrbitSection> createState() => _UniverseOrbitSectionState();
}

class _UniverseOrbitSectionState extends State<UniverseOrbitSection> {
  String _selectedRange = 'Day';

  static const Offset _centerFraction = Offset(0.45, 0.52);

  // TODO(backend): replace this with data fetched per `_selectedRange`.
  // Structure is already position/status/badge driven — swap the list,
  // nothing in the widgets needs to change.
  List<OrbitBody> _bodiesForRange(String range) {
    return const [
      OrbitBody(
        id: 'morning_routine',
        label: 'Morning Routine',
        markerPosition: Offset(0.244, 0.174),
        labelPosition: Offset(0.244, 0.255),
        status: OrbitStatus.personnelEvent,
        imagePath: AppImage.routineAndGoal,
        markerSize: 34,
      ),
      OrbitBody(
        id: 'personal_goal',
        label: 'Personal Goal',
        markerPosition: Offset(0.602, 0.652),
        labelPosition: Offset(0.602, 0.735),
        status: OrbitStatus.personnelEvent,
        imagePath: AppImage.routineAndGoal,
        markerSize: 30,
      ),
      OrbitBody(
        id: 'project_alpha',
        label: 'Project Alpha',
        markerPosition: Offset(0.822, 0.686),
        labelPosition: Offset(0.822, 0.765),
        status: OrbitStatus.inProgress,
        imagePath: AppImage.projectAlpha,
        markerSize: 46,
        hasRingBorder: true,
      ),
      OrbitBody(
        id: 'project_beta',
        label: 'Project Beta',
        markerPosition: Offset(0.081, 0.706),
        labelPosition: Offset(0.081, 0.785),
        status: OrbitStatus.notStarted,
        imagePath: AppImage.projectBeta,
        markerSize: 46,
        hasRingBorder: true,
        showSatelliteDot: true,
        badgeCount: 3,
      ),
      OrbitBody(
        id: 'start_point',
        label: 'Start Point',
        markerPosition: Offset(0.834, 0.538),
        labelPosition: Offset(0.918, 0.538),
        status: OrbitStatus.dedicatedSpot,
        markerSize: 10,
      ),
      OrbitBody(
        id: 'end_point',
        label: 'End Point',
        markerPosition: Offset(0.451, 0.715),
        labelPosition: Offset(0.373, 0.715),
        status: OrbitStatus.dedicatedSpot,
        markerSize: 10,
      ),
    ];
  }

  List<OrbitConnector> _connectorsForRange(String range) {
    return const [
      OrbitConnector(
        from: Offset(0.834, 0.538),
        to: Offset(0.822, 0.660),
        color: AppColors.green,
      ),
      OrbitConnector(
        from: Offset(0.373, 0.715),
        to: Offset(0.451, 0.715),
        color: AppColors.orange,
      ),
      OrbitConnector(
        from: Offset(0.451, 0.715),
        to: Offset(0.45, 0.60),
        color: AppColors.orange,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const OrbitLegend(),

          SizedBox(height: 4.h),

          UniverseOrbitDiagram(
            centerFraction: _centerFraction,
            bodies: _bodiesForRange(_selectedRange),
            connectors: _connectorsForRange(_selectedRange),
            centerImageUrl:
            'https://images.unsplash.com/photo-1534528741775-53994a69daeb?auto=format&fit=crop&q=80&w=300',
            height: 38.h,
          ),

          SizedBox(height: 5.h),

          UniverseTimeRangeTabBar(
            selected: _selectedRange,
            onChanged: (value) => setState(() => _selectedRange = value),
          ),

          SizedBox(height: 9.h),
        ],
      ),
    );
  }
}