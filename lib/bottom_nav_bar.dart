import '../config/barrel.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;

  const BottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  static const List<_NavItemData> _items = [
    _NavItemData(icon: AppImage.globalIcon, label: 'Your Universe'),
    _NavItemData(icon: AppImage.checkBoxIcon, label: 'To Do List'),
    _NavItemData(icon: AppImage.draftIcon, label: 'Drafts'),
    _NavItemData(icon: AppImage.boxIcon, label: 'Archive'),
    _NavItemData(icon: AppImage.itemFiveIcon, label: 'Tree View'),
  ];

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: 100.w,
          height: 9.h,
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.2.h),
          decoration: BoxDecoration(color: AppColors.dark),
          child: SafeArea(
            top: false,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(_items.length, (index) {
                final isSelected = selectedIndex == index;
                final item = _items[index];
                final isToDoList = index == 1;

                return onTap(
                  onTap: () {
                    if (selectedIndex != index) {
                      onItemTapped(index);
                    }
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeOutCubic,
                    padding: EdgeInsets.symmetric(
                      horizontal: isSelected ? 4.w : 2.w,
                      vertical: 1.h,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? (isToDoList ? AppColors.gold : AppColors.blue)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          item.icon,
                          width: 20.px,
                          height: 20.px,
                          color: isSelected
                              ? AppColors.white
                              : (isToDoList
                              ? AppColors.gold.withValues(alpha: 0.8)
                              : AppColors.white),
                          fit: BoxFit.contain,
                        ),
                        if (isSelected) ...[
                          SizedBox(width: 2.w),
                          Padding(
                            padding:  EdgeInsets.only(top:0.7.w ),
                            child: CustomText(
                              item.label,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}

class _NavItemData {
  final String icon;
  final String label;

  const _NavItemData({required this.icon, required this.label});
}