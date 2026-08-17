import '../../../config/barrel.dart';

class NotesTabView extends StatelessWidget {
  final bool isSelectionMode;

  const NotesTabView({
    super.key,
    this.isSelectionMode = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 1.h),

        // Add Note Input Box
        Container(
          padding: EdgeInsets.all(12.px),
          decoration: BoxDecoration(
            color: AppColors.greyDark,
            borderRadius: BorderRadius.circular(14.px),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              AppTextField(
                hintColor: AppColors.white.withValues(alpha: 0.60),
                borderColor: Colors.transparent,
                fillColor: Colors.transparent,
                focusBorderColor: Colors.transparent,
                height: 70.px,
                hintText: 'Type a note...',
                hintSize: 12.px,
                textSize: 12.px,
                maxLines: 3,
                contentPadding: EdgeInsets.only(
                  bottom: 1.w,
                  right: 2.w,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 12.px,
                  vertical: 6.px,
                ),
                decoration: BoxDecoration(
                  color: AppColors.blue,
                  borderRadius: BorderRadius.circular(7.px),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.black.withValues(alpha: 0.10),
                      offset: const Offset(0, 2.71),
                      blurRadius: 4.07,
                      spreadRadius: -2.71,
                    ),
                    BoxShadow(
                      color: AppColors.black.withValues(alpha: 0.10),
                      offset: const Offset(0, 6.78),
                      blurRadius: 10.18,
                      spreadRadius: -2.04,
                    ),
                  ],
                ),
                child: CustomText(
                  'Add Note',
                  fontSize: 10.px,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: isSelectionMode ? 2.h : 7.h),

        // SELECTION MODE (Alpha / Beta / Gamma): Note Card from Screenshot
        if (isSelectionMode) ...[
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.greyDark,
              borderRadius: BorderRadius.circular(16.px),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Note Text Area
                Padding(
                  padding: EdgeInsets.all(14.px),
                  child: CustomText(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do usermod '
                        'temper incident ut labor et do lore magna aliquot. Ut enum ad '
                        'minim venial, quits nostrum excitation McCull och labors nisi ut '
                        'aliquot ex ea commode consequent.',
                    fontSize: 11.5.px,
                    color: AppColors.white.withValues(alpha: 0.70),
                    fontWeight: FontWeight.w400,
                    height: 1.35,
                  ),
                ),

                // Subtle Divider
                Divider(
                  color: AppColors.white.withValues(alpha: 0.10),
                  height: 1.px,
                  thickness: 1.px,
                ),

                // Card Footer (Date + Action Icons)
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 14.px,
                    vertical: 10.px,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Date
                      CustomText(
                        '2/21/2026',
                        fontSize: 11.px,
                        color: AppColors.white.withValues(alpha: 0.50),
                        fontWeight: FontWeight.w400,
                      ),

                      // Edit & Delete Action Buttons
                      Row(
                        children: [
                          _buildCircleActionButton(
                            icon: Icons.edit_outlined,
                            onTap: () {},
                          ),
                          SizedBox(width: 8.px),
                          _buildCircleActionButton(
                            icon: Icons.delete_outline_rounded,
                            onTap: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 3.h),
        ]
        // NORMAL MODE: Empty Draft State
        else ...[
          Image.asset(
            AppImage.draftIcon,
            color: AppColors.white.withValues(alpha: 0.40),
            height: 45.px,
            width: 45.px,
          ),
          SizedBox(height: 1.5.h),
          CustomText(
            'No notes recorded',
            fontSize: 13.px,
            color: AppColors.white.withValues(alpha: 0.25),
            fontWeight: FontWeight.w400,
          ),
          SizedBox(height: 15.h),
        ],
      ],
    );
  }

  // Circular Action Icon Button Helper
  Widget _buildCircleActionButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(7.px),
        decoration: BoxDecoration(
          color: AppColors.white.withValues(alpha: 0.08),
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          size: 15.px,
          color: AppColors.white.withValues(alpha: 0.65),
        ),
      ),
    );
  }
}