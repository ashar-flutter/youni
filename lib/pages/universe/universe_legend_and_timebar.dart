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
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.6.h),
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
              padding: EdgeInsets.only(bottom: i == _entries.length - 1 ? 0 : 0.9.h),
              child: Row(
                children: [
                  Container(
                    width: 3.w,
                    height: 3.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _entries[i].color,
                    ),
                  ),
                  SizedBox(width: 2.5.w),
                  CustomText(
                    _entries[i].label,
                    fontSize: 14.sp,
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

class UniverseOrbitSection extends StatefulWidget {
  const UniverseOrbitSection({super.key});

  @override
  State<UniverseOrbitSection> createState() => _UniverseOrbitSectionState();
}

class _UniverseOrbitSectionState extends State<UniverseOrbitSection> {
  String _selectedRange = 'Day';

  static const Offset _centerFraction = Offset(0.45, 0.52);

  // TODO(backend): replace with data fetched per `_selectedRange` —
  // structure is position/status/badge driven, nothing else changes.
  List<OrbitBody> _bodiesForRange(String range) {
    return const [
      OrbitBody(
        id: 'morning_routine',
        label: 'Morning Routine',
        markerPosition: Offset(0.244, 0.174),
        labelPosition: Offset(0.244, 0.255),
        status: OrbitStatus.personnelEvent,
        imagePath: AppImage.routineAndGoal,
        markerSize: 26,
      ),
      OrbitBody(
        id: 'personal_goal',
        label: 'Personal Goal',
        markerPosition: Offset(0.602, 0.652),
        labelPosition: Offset(0.602, 0.735),
        status: OrbitStatus.personnelEvent,
        imagePath: AppImage.routineAndGoal,
        markerSize: 24,
      ),
      OrbitBody(
        id: 'project_alpha',
        label: 'Project Alpha',
        markerPosition: Offset(0.822, 0.686),
        labelPosition: Offset(0.822, 0.765),
        status: OrbitStatus.inProgress,
        imagePath: AppImage.projectAlpha,
        markerSize: 36,
      ),
      OrbitBody(
        id: 'project_beta',
        label: 'Project Beta',
        markerPosition: Offset(0.081, 0.706),
        labelPosition: Offset(0.081, 0.785),
        status: OrbitStatus.notStarted,
        imagePath: AppImage.projectBeta,
        markerSize: 36,
        showSatelliteDot: true,
        badgeCount: 3,
      ),
      OrbitBody(
        id: 'start_point',
        label: 'Start Point',
        markerPosition: Offset(0.834, 0.538),
        labelPosition: Offset(0.918, 0.538),
        status: OrbitStatus.dedicatedSpot,
        markerSize: 9,
      ),
      OrbitBody(
        id: 'end_point',
        label: 'End Point',
        markerPosition: Offset(0.451, 0.715),
        labelPosition: Offset(0.373, 0.680),
        status: OrbitStatus.dedicatedSpot,
        markerSize: 9,
      ),
    ];
  }

  // Short indicator stubs only — no line above Start Point, no
  // circle-like loop. Each is anchor + direction + length.
  List<OrbitConnector> _connectorsForRange(String range) {
    return const [
      // Start Point: a short line pointing DOWN toward the ring — nothing above it.
      OrbitConnector(
        anchorFraction: Offset(0.834, 0.538),
        angleDeg: 90,
        lengthFactor: 0.075,
        color: AppColors.green,
      ),
      // End Point: a short line pointing RIGHT, with a dot at its tip.
      OrbitConnector(
        anchorFraction: Offset(0.451, 0.715),
        angleDeg: 0,
        lengthFactor: 0.075,
        color: AppColors.orange,
        dotAtEnd: true,
        dotSize: 8,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      child: Column(
        children: [
          const OrbitLegend(),
          SizedBox(height: 2.h),
          UniverseOrbitDiagram(
            centerFraction: _centerFraction,
            bodies: _bodiesForRange(_selectedRange),
            connectors: _connectorsForRange(_selectedRange),
            centerImageUrl:
            'https://images.unsplash.com/photo-1534528741775-53994a69daeb?auto=format&fit=crop&q=80&w=300',
            height: 38.h,
          ),
          SizedBox(height: 2.h),
          UniverseTimeRangeTabBar(
            selected: _selectedRange,
            onChanged: (value) => setState(() => _selectedRange = value),
          ),
        ],
      ),
    );
  }
}