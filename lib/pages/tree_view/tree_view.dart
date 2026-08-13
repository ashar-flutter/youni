import '../../config/barrel.dart';

class TreeView extends StatelessWidget {
  const TreeView({super.key});

  static final _TreeNodeData _rootNode = _TreeNodeData(
    title: 'Project Alpha',
    badge: 'STAR',
    icon: Icons.star_border_rounded,
    color: AppColors.gold,
    hasGlow: true,
    isExpanded: true,
    children: [
      _TreeNodeData(
        title: 'Development Phase',
        badge: 'PLANET',
        icon: Icons.language_rounded,
        color: AppColors.blue,
        hasGlow: false,
        isExpanded: true,
        children: [
          _TreeNodeData(
            title: 'Frontend',
            badge: 'MOON',
            icon: Icons.nightlight_outlined,
            color: const Color(0xFF4A5A70),
            hasGlow: false,
            isExpanded: true,
            children: [
              _TreeNodeData(
                title: 'UI Components',
                badge: 'SATELLITE',
                icon: Icons.satellite_alt_rounded,
                color: const Color(0xFF536074),
                hasGlow: false,
                isExpanded: true,
                children: const [],
              ),
            ],
          ),
          _TreeNodeData(
            title: 'Backend',
            badge: 'MOON',
            icon: Icons.nightlight_outlined,
            color: const Color(0xFF4A5A70),
            hasGlow: false,
            isExpanded: true,
            children: const [],
          ),
        ],
      ),
      _TreeNodeData(
        title: 'Design Phase',
        badge: 'PLANET',
        icon: Icons.language_rounded,
        color: AppColors.blue,
        hasGlow: false,
        isExpanded: false,
        children: const [],
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          const MainAppBar(showPremiumAndFeatures: false),

          SizedBox(height: 3.h),

          const NewEntityRow(),

          SizedBox(height: 3.h),

          // Visual Map Container
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 4.w),
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.5.h),
            decoration: BoxDecoration(
              color: AppColors.greyDark.withValues(alpha: 0.67),
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: AppColors.greyDark, width: 1),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.account_tree_rounded,
                      size: 5.5.w,
                      color: AppColors.green,
                    ),
                    SizedBox(width: 2.5.w),
                    CustomText(
                      'Visual Map',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ],
                ),

                SizedBox(height: 0.6.h),

                CustomText(
                  'Hierarchical view',
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.white.withValues(alpha: 0.5),
                ),

                SizedBox(height: 3.h),

                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 2.h,
                      horizontal: 4.w,
                    ),
                    child: _TreeBranch(data: _rootNode),
                  ),
                ),

                SizedBox(height: 1.h),
              ],
            ),
          ),

          SizedBox(height: 3.h),
        ],
      ),
    );
  }
}

class _TreeNodeData {
  final String title;
  final String badge;
  final IconData? icon;
  final String? imageAsset;
  final Color color;
  final bool? _hasGlow; // Nullable internal field
  final bool? _isExpanded; // Nullable internal field
  final List<_TreeNodeData> children;

  const _TreeNodeData({
    required this.title,
    required this.badge,
    this.icon,
    this.imageAsset,
    required this.color,
    bool this._hasGlow = false,
    bool this._isExpanded = true,
    required this.children,
  });

  // Non-nullable getters with default fallback values
  bool get hasGlow => _hasGlow ?? false;
  bool get isExpanded => _isExpanded ?? true;
}

class _TreeBranch extends StatelessWidget {
  final _TreeNodeData data;

  const _TreeBranch({required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _MapNode(data: data),

        if (data.children.isNotEmpty) ...[
          if (data.children.length > 1) ...[
            CustomPaint(
              size: Size(38.w, 3.h),
              painter: _MultiChildLinePainter(),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: data.children.map((child) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.w),
                  child: _TreeBranch(data: child),
                );
              }).toList(),
            ),
          ] else ...[
            CustomPaint(
              size: Size(18.w, 4.h),
              painter: _SingleChildStepLinePainter(),
            ),
            _TreeBranch(data: data.children.first),
          ],
        ],
      ],
    );
  }
}

class _MapNode extends StatelessWidget {
  final _TreeNodeData data;

  const _MapNode({required this.data});

  @override
  Widget build(BuildContext context) {
    // Null safety fallbacks to prevent crash
    final bool showGlow = data.hasGlow == true;
    final bool expanded = data.isExpanded == true;

    return Stack(
      alignment: Alignment.bottomCenter,
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 32.w,
          margin: EdgeInsets.only(bottom: 1.2.h),
          padding: EdgeInsets.symmetric(vertical: 1.8.h, horizontal: 2.w),
          decoration: BoxDecoration(
            color: data.color,
            borderRadius: BorderRadius.circular(16),
            boxShadow: showGlow
                ? [
                    BoxShadow(
                      color: data.color.withValues(alpha: 0.5),
                      blurRadius: 16,
                      spreadRadius: 2,
                    ),
                  ]
                : [],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 8.w,
                height: 8.w,
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: data.imageAsset != null
                      ? Image.asset(
                          data.imageAsset!,
                          width: 4.5.w,
                          height: 4.5.w,
                          color: data.color,
                        )
                      : Icon(
                          data.icon ?? Icons.circle,
                          size: 5.w,
                          color: data.color,
                        ),
                ),
              ),

              SizedBox(height: 1.2.h),

              CustomText(
                data.title,
                fontSize: 11.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.white,
                textAlign: TextAlign.center,
                maxLines: 2,
              ),

              SizedBox(height: 0.4.h),

              CustomText(
                data.badge,
                fontSize: 8.5.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.white.withValues(alpha: 0.75),
              ),
            ],
          ),
        ),

        Positioned(
          bottom: 0,
          child: Container(
            width: 5.5.w,
            height: 5.5.w,
            decoration: BoxDecoration(
              color: const Color(0xFF1E232B),
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.white.withValues(alpha: 0.15),
                width: 1,
              ),
            ),
            child: Icon(
              expanded
                  ? Icons.keyboard_arrow_up_rounded
                  : Icons.keyboard_arrow_down_rounded,
              size: 3.8.w,
              color: AppColors.white,
            ),
          ),
        ),
      ],
    );
  }
}

class _MultiChildLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.white.withValues(alpha: 0.8)
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;

    final path = Path();
    path.moveTo(size.width / 2, 0);
    path.lineTo(size.width / 2, size.height / 2);

    path.moveTo(0, size.height / 2);
    path.lineTo(size.width, size.height / 2);

    path.moveTo(0, size.height / 2);
    path.lineTo(0, size.height);

    path.moveTo(size.width, size.height / 2);
    path.lineTo(size.width, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _SingleChildStepLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.white.withValues(alpha: 0.8)
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;

    final path = Path();
    path.moveTo(size.width / 2, 0);
    path.lineTo(size.width / 2, size.height / 2);
    path.lineTo(size.width * 0.1, size.height / 2);
    path.lineTo(size.width * 0.1, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
