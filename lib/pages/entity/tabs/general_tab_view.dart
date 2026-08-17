import '../../../config/barrel.dart';

class GeneralTabView extends StatelessWidget {
  final bool isSelectionMode;

  const GeneralTabView({
    super.key,
    this.isSelectionMode = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 1.h),

        // Entity Type Field (ONLY in Normal Mode)
        if (!isSelectionMode) ...[
          AppTextField(
            focusBorderColor: Colors.transparent,
            labelGap: 1.5.h,
            borderColor: Colors.transparent,
            hintColor: AppColors.white.withValues(alpha: 0.50),
            hintSize: 12.px,
            textSize: 12.px,
            labelSize: 12.px,
            fillColor: AppColors.greyDark,
            height: 40.px,
            labelText: 'Entity Type',
            readOnly: true,
            hintText: 'Star',
            suffixIcon: Icon(
              Icons.keyboard_arrow_down_rounded,
              size: 20.px,
              color: AppColors.white.withValues(alpha: 0.50),
            ),
            onTap: () {},
          ),
          SizedBox(height: 2.5.h),
        ],
        if (isSelectionMode) ...[
          Align(
            alignment: Alignment.centerRight,
            child: onTap(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 12.px,
                  vertical: 4.px,
                ),
                decoration: BoxDecoration(
                  color: AppColors.charcoal,
                  borderRadius: BorderRadius.circular(16.px),
                  border: Border.all(
                    color: AppColors.white.withValues(alpha: 0.20),
                    width: 1.px,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.edit_outlined,
                      size: 11.px,
                      color: AppColors.white,
                    ),
                    SizedBox(width: 4.px),
                    CustomText(
                      'Edit',
                      fontSize: 10.px,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 1.h),
        ],

        // Entity Name
        AppTextField(
          hintColor: AppColors.white.withValues(alpha: 0.50),
          borderColor: Colors.transparent,
          labelGap: 1.5.h,
          labelText: "Entity Name",
          labelSize: 12.px,
          fillColor: AppColors.greyDark,
          height: 40.px,
          hintText: 'E.g. Project Apollo',
          hintSize: 12.px,
          textSize: 12.px,
        ),
        SizedBox(height: 2.5.h),

        // Description Field
        AppTextField(
          hintColor: AppColors.white.withValues(alpha: 0.50),
          borderColor: Colors.transparent,
          labelSize: 12.px,
          labelGap: 1.5.h,
          labelText: "Description",
          fillColor: AppColors.greyDark,
          height: 12.h,
          hintText: 'Enter a detailed description of the mission objectives...',
          hintSize: 12.px,
          textSize: 12.px,
          maxLines: 5,
          minLines: 5,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 4.w,
            vertical: 1.4.h,
          ),
        ),

        // Draft Mode Tag (ONLY in Normal Mode)
        if (!isSelectionMode) ...[
          SizedBox(height: 2.3.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 13.px, vertical: 5.px),
            decoration: BoxDecoration(
              color: AppColors.gold.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(20.px),
              border: Border.all(
                color: AppColors.gold.withValues(alpha: 0.30),
                width: 0.8,
              ),
            ),
            child: CustomText(
              'Draft Mode',
              fontSize: 10.px,
              color: AppColors.gold,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 4.3.h),
        ],

        // Planet, Moon & Satellite Rows (ONLY in Selection Mode - 1st Screenshot)
        if (isSelectionMode) ...[
          SizedBox(height: 2.5.h),

          // Planet Section
          _buildEntityHierarchyRow(
            buttonTitle: 'Planet',
            iconAsset: AppImage.globalIcon,
            itemLogoAsset: AppImage.planetLogo,
            itemText: 'Planet Name',
          ),

          SizedBox(height: 2.h),

          // Moon Section
          _buildEntityHierarchyRow(
            buttonTitle: 'Moon',
            flutterIcon: Icons.nightlight_round_outlined,
            itemLogoAsset: AppImage.moonLogo,
            itemText: 'Moon Name',
          ),

          SizedBox(height: 2.h),

          // Satellite Section
          _buildEntityHierarchyRow(
            buttonTitle: 'Satellite',
            flutterIcon: Icons.cell_tower_rounded,
            itemLogoAsset: AppImage.satelliteLogo,
            itemText: 'Satellite Name',
          ),

          SizedBox(height: 1.h),
        ],
      ],
    );
  }

  // Helper Widget for Planet/Moon/Satellite Rows
  Widget _buildEntityHierarchyRow({
    required String buttonTitle,
    String? iconAsset,
    IconData? flutterIcon,
    required String itemLogoAsset,
    required String itemText,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Action Buttons Row
        Row(
          children: [
            // Blue Primary Category Button
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 12.px,
                vertical: 5.px,
              ),
              decoration: BoxDecoration(
                color: AppColors.blue,
                borderRadius: BorderRadius.circular(9.px),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (iconAsset != null)
                    Image.asset(
                      iconAsset,
                      width: 12.px,
                      height: 12.px,
                      color: AppColors.white,
                    )
                  else if (flutterIcon != null)
                    Icon(
                      flutterIcon,
                      size: 12.px,
                      color: AppColors.white,
                    ),
                  SizedBox(width: 6.px),
                  CustomText(
                    buttonTitle,
                    fontSize: 10.px,
                    color: AppColors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
            ),

            SizedBox(width: 8.px),

            // Plus Button
            _buildSmallSquareButton(
              child: Icon(
                Icons.add_rounded,
                size: 12.px,
                color: AppColors.white,
              ),
              onTap: () {},
            ),

            SizedBox(width: 8.px),

            // Delete Button
            _buildSmallSquareButton(
              child: Icon(
                Icons.delete_outline_rounded,
                size: 13.px,
                color: AppColors.white,
              ),
              onTap: () {},
            ),
          ],
        ),

        SizedBox(height: 1.6.h),

        // Horizontally Scrollable Entities List
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          child: Row(
            children: List.generate(3, (index) {
              return Padding(
                padding: EdgeInsets.only(right: 14.px),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      itemLogoAsset,
                      width: 14.px,
                      height: 14.px,
                      errorBuilder: (context, error, stackTrace) => Container(
                        width: 15.px,
                        height: 15.px,
                        decoration: const BoxDecoration(
                          color: AppColors.gold,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    SizedBox(width: 4.px),
                    CustomText(
                      itemText,
                      fontSize: 8.5.px,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
      ],
    );
  }

  Widget _buildSmallSquareButton({
    required Widget child,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 24.px,
        height: 24.px,
        decoration: BoxDecoration(
          color: AppColors.charcoal,
          borderRadius: BorderRadius.circular(6.px),
          border: Border.all(
            color: AppColors.white.withValues(alpha: 0.30),
            width: 1.px,
          ),
        ),
        child: Center(child: child),
      ),
    );
  }
}