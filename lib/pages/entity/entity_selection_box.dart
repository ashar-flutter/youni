import '../../config/barrel.dart';

class EntityItemData {
  final String title;
  final String subtitle;
  final String imagePath;
  final VoidCallback? onTap;

  const EntityItemData({
    required this.title,
    required this.subtitle,
    required this.imagePath,
    this.onTap,
  });
}

const List<EntityItemData> defaultEntities = [
  EntityItemData(
    title: 'Project Alpha',
    subtitle: 'Star 1',
    imagePath: AppImage.projectBeta,
  ),
  EntityItemData(
    title: 'Project Beta',
    subtitle: 'Star 2',
    imagePath: AppImage.projectBeta,
  ),
  EntityItemData(
    title: 'Project Gamma',
    subtitle: 'Star 3',
    imagePath: AppImage.projectBeta,
  ),
];

class EntitySelectionBox extends StatelessWidget {
  final String title;
  final List<EntityItemData> entities;

  const EntitySelectionBox({
    super.key,
    this.title = 'All Entities',
    this.entities = defaultEntities,
  });

  static Future<T?> show<T>({
    String title = 'All Entities',
    List<EntityItemData> entities = defaultEntities,
  }) {
    return Get.dialog<T>(
      EntitySelectionBox(title: title, entities: entities),
      barrierDismissible: true,
      barrierColor: AppColors.black.withValues(alpha: 0.6),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(horizontal: 26.px, vertical: 4.h),
      child: Container(
        width: 280.px,
        decoration: BoxDecoration(
          color: AppColors.charcoal,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: AppColors.white.withValues(alpha: 0.12),
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withValues(alpha: 0.5),
              blurRadius: 16.px,
              offset: Offset(0, 8.px),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Padding(
              padding: EdgeInsets.fromLTRB(16.px, 16.px, 16.px, 12.px),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(title, fontSize: 13.px),
                  onTap(
                    onTap: () => Get.back(),
                    child: Container(
                      padding: EdgeInsets.all(2.px),
                      color: Colors.transparent,
                      child: Icon(
                        Icons.close,
                        color: AppColors.greyLight,
                        size: 14.px,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Divider(
              color: AppColors.white.withValues(alpha: 0.1),
              height: 1.px,
              thickness: 1.px,
            ),

            SizedBox(height: 1.h),

            // Content Body
            Padding(
              padding: EdgeInsets.all(16.px),
              child: Flexible(
                child: ListView.separated(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemCount: entities.length,
                  separatorBuilder: (context, index) => SizedBox(height: 3.6.h),
                  itemBuilder: (context, index) {
                    final item = entities[index];

                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _EntityListTile(item: item),
                        if (index == entities.length - 1) SizedBox(height: 1.h),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _EntityListTile extends StatelessWidget {
  final EntityItemData item;

  const _EntityListTile({required this.item});

  @override
  Widget build(BuildContext context) {
    return onTap(
      onTap: () {
        final String selectedTitle = item.title;

        Get.back();

        Future.delayed(const Duration(seconds: 1), () {
          Get.dialog(
            CreateNewEntityDialog(title: selectedTitle),
            barrierDismissible: true,
            barrierColor: Colors.black.withValues(alpha: 0.60),
          );
        });
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 2.px, horizontal: 2.px),
        child: Row(
          children: [
            // Smaller Image Container
            Container(
              width: 38.px,
              height: 38.px,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.red, width: 2.5.px),
              ),
              child: ClipOval(
                child: Image.asset(
                  item.imagePath,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      Container(color: AppColors.gold),
                ),
              ),
            ),

            SizedBox(width: 12.px),

            // Titles
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomText(item.title, fontSize: 13.px),
                  SizedBox(height: 2.px),
                  CustomText(
                    item.subtitle,
                    fontSize: 10.px,
                    fontWeight: FontWeight.w400,
                    color: AppColors.greyMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
