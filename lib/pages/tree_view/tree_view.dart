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

          SizedBox(height: 2.h),

          const NewEntityRow(),

          SizedBox(height: 3.h),

          // Visual Map Outer Container
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 7.w),
            padding: EdgeInsets.symmetric(
              horizontal: 3.w,
              vertical: 2.h,
            ),
            decoration: BoxDecoration(
              color: AppColors.charcoal,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: AppColors.greyDark,
                width: 1,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: 1.w,),
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
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ],
                ),

                SizedBox(height: 0.4.h),

                Padding(
                  padding:  EdgeInsets.only(left: 9.w),
                  child: CustomText(
                    'Hierarchical view',
                    fontSize: 12.8.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.white.withValues(alpha: 0.4),
                  ),
                ),

                SizedBox(height: 6.h),

                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: _SixNodeTree(),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 3.h),
        ],
      ),
    );
  }
}

// ================================================================
// SIX NODE TREE
// ================================================================

class _SixNodeTree extends StatelessWidget {
  const _SixNodeTree();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320,
      height: 530,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // ========================================================
          // 1. PROJECT ALPHA (ROOT)
          // ========================================================
          // Card: Project Alpha (Center Top)
          Positioned(
            left: 110,
            top: 0,
            width: 100,
            height: 80,
            child: _MapNode(data: TreeView._rootNode),
          ),

          // Vertical Line Down from Root Arrow
          Positioned(
            left: 159,
            top: 80,
            width: 1.5,
            height: 40,
            child: Container(color: AppColors.white.withValues(alpha: 0.8)),
          ),

          // Horizontal Split Line (Dev <-> Design)
          Positioned(
            left: 70,
            top: 120,
            width: 180,
            height: 1.5,
            child: Container(color: AppColors.white.withValues(alpha: 0.8)),
          ),

          // Drop Line to Development Phase
          Positioned(
            left: 70,
            top: 120,
            width: 1.5,
            height: 25,
            child: Container(color: AppColors.white.withValues(alpha: 0.8)),
          ),

          // Drop Line to Design Phase
          Positioned(
            left: 249,
            top: 120,
            width: 1.5,
            height: 25,
            child: Container(color: AppColors.white.withValues(alpha: 0.8)),
          ),

          // ========================================================
          // 2. PHASE LEVEL (DEV & DESIGN)
          // ========================================================
          // Node: Development Phase
          Positioned(
            left: 15,
            top: 145,
            width: 110,
            height: 75,
            child: _MapNode(data: TreeView._rootNode.children[0]),
          ),

          // Node: Design Phase
          Positioned(
            left: 195,
            top: 145,
            width: 110,
            height: 75,
            child: _MapNode(data: TreeView._rootNode.children[1]),
          ),

          // Vertical Line Down from Dev Phase Arrow
          Positioned(
            left: 69,
            top: 220,
            width: 1.5,
            height: 40,
            child: Container(color: AppColors.white.withValues(alpha: 0.8)),
          ),

          // Horizontal Split Line (Frontend <-> Backend)
          Positioned(
            left: 35,
            top: 260,
            width: 70,
            height: 1.5,
            child: Container(color: AppColors.white.withValues(alpha: 0.8)),
          ),

          // Drop Line to Frontend
          Positioned(
            left: 35,
            top: 260,
            width: 1.5,
            height: 20,
            child: Container(color: AppColors.white.withValues(alpha: 0.8)),
          ),

          // Drop Line to Backend
          Positioned(
            left: 105,
            top: 260,
            width: 1.5,
            height: 20,
            child: Container(color: AppColors.white.withValues(alpha: 0.8)),
          ),

          // ========================================================
          // 3. FRONTEND & BACKEND LEVEL
          // ========================================================
          // Node: Frontend
          Positioned(
            left: 5,
            top: 280,
            width: 62,
            height: 70,
            child: _MapNode(data: TreeView._rootNode.children[0].children[0]),
          ),

          // Node: Backend
          Positioned(
            left: 75,
            top: 280,
            width: 62,
            height: 70,
            child: _MapNode(data: TreeView._rootNode.children[0].children[1]),
          ),

          // Line Down from Frontend Arrow
          Positioned(
            left: 35,
            top: 350,
            width: 1.5,
            height: 45,
            child: Container(color: AppColors.white.withValues(alpha: 0.8)),
          ),

          // Step Line Left towards UI Components
          Positioned(
            left: 5,
            top: 395,
            width: 31.5,
            height: 1.5,
            child: Container(color: AppColors.white.withValues(alpha: 0.8)),
          ),

          // Line Down into UI Components Node Top Center
          Positioned(
            left: 5,
            top: 395,
            width: 1.5,
            height: 35,
            child: Container(color: AppColors.white.withValues(alpha: 0.8)),
          ),

          // ========================================================
          // 4. UI COMPONENTS (BOTTOM NODE)
          // ========================================================
          // Node: UI Components
          Positioned(
            left: -38,
            top: 430,
            width: 90,
            height: 72,
            child: _MapNode(
              data: TreeView._rootNode.children[0].children[0].children[0],
            ),
          ),
        ],
      ),
    );
  }
}

// ================================================================
// NODE DATA MODEL
// ================================================================

class _TreeNodeData {
  final String title;
  final String badge;
  final IconData? icon;
  final String? imageAsset;
  final Color color;
  final bool? _hasGlow;
  final bool? _isExpanded;
  final List<_TreeNodeData> children;

  const _TreeNodeData({
    required this.title,
    required this.badge,
    this.icon,
    required this.color,
    bool this._hasGlow = false,
    bool this._isExpanded = true,
    required this.children,
  }) : imageAsset = null;

  bool get hasGlow => _hasGlow ?? false;

  bool get isExpanded => _isExpanded ?? true;
}

// ================================================================
// MAP NODE (COMPACT & MATCHED TO SCREENSHOT)
// ================================================================

class _MapNode extends StatelessWidget {
  final _TreeNodeData data;

  const _MapNode({
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    final bool showGlow = data.hasGlow;
    final bool expanded = data.isExpanded;

    return Stack(
      alignment: Alignment.bottomCenter,
      clipBehavior: Clip.none,
      children: [
        // Main Card
        Container(
          width: double.infinity,
          height: double.infinity,
          margin: const EdgeInsets.only(bottom: 8),
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
          decoration: BoxDecoration(
            color: data.color,
            borderRadius: BorderRadius.circular(12),
            boxShadow: showGlow
                ? [
              BoxShadow(
                color: data.color.withValues(alpha: 0.20),
                blurRadius: 18.6,
                spreadRadius: 0,
              ),
            ]
                : [],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // White Circle Badge
              Container(
                width: 20,
                height: 20,
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: data.imageAsset != null
                      ? Image.asset(
                    data.imageAsset!,
                    width: 12,
                    height: 12,
                    color: data.color,
                  )
                      : Icon(
                    data.icon ?? Icons.circle,
                    size: 13,
                    color: data.color,
                  ),
                ),
              ),

              const SizedBox(height: 3),

              // Node Title
              CustomText(
                data.title,
                fontSize: 12.sp,
                fontWeight: FontWeight.w700,
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 1),

              // Node Subtitle / Badge
              CustomText(
                data.badge,
                fontSize: 11.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.white.withValues(alpha: 0.75),
                textAlign: TextAlign.center,
              ),

            ],
          ),
        ),

        // Arrow Circle Toggle at Bottom Center
        Positioned(
          bottom: 0,
          child: Container(
            width: 16,
            height: 16,
            decoration: BoxDecoration(
              color: const Color(0xFF1E232B),
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.white.withValues(alpha: 0.25),
                width: 1,
              ),
            ),
            child: Icon(
              expanded
                  ? Icons.keyboard_arrow_up_rounded
                  : Icons.keyboard_arrow_down_rounded,
              size: 11,
              color: AppColors.white,
            ),
          ),
        ),
      ],
    );
  }
}