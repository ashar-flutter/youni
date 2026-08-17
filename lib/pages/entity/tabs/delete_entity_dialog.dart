import '../../../config/barrel.dart';

class DeleteEntityDialog extends StatelessWidget {
  final VoidCallback onConfirm;
  final VoidCallback? onCancel;

  const DeleteEntityDialog({
    super.key,
    required this.onConfirm,
    this.onCancel,
  });

  static Future<void> show({
    required VoidCallback onConfirm,
    VoidCallback? onCancel,
  }) {
    return Get.dialog(
      DeleteEntityDialog(
        onConfirm: onConfirm,
        onCancel: onCancel,
      ),
      barrierColor: AppColors.dark.withValues(alpha: 0.90),
      transitionCurve: Curves.easeInOut,
      transitionDuration: const Duration(milliseconds: 250),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(horizontal: 7.w),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.5.h),
        decoration: BoxDecoration(
          color: AppColors.blueBright.withValues(alpha: 0.09),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: AppColors.greyDark,
            width: 3,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 1.2.h),

            // Title
            CustomText(
              'Are you absolutely sure?',
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
            ),
            SizedBox(height: 1.2.h),

            // Subtitle
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.w),
              child: CustomText(
                'If you delete a star all entities within will be deleted.',
                fontSize: 13.sp,
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 3.h),

            // Action Buttons Row
            Row(
              children: [
                Expanded(
                  child: _buildRedButton('Cancel'),
                ),
                SizedBox(width: 3.w),
                Expanded(
                  child: _buildSecondaryButton('Delete Entity'),
                ),
              ],
            ),
            SizedBox(height: 1.5.h),
          ],
        ),
      ),
    );
  }

  // Red Action Button (Destructive)
  Widget _buildRedButton(String text) {
    return AppButton(
      height: 42.px,
      text: text,
      fontSize: 14.sp,
      backgroundColor: AppColors.red.withValues(alpha: 0.12),
      borderColor: AppColors.red.withValues(alpha: 0.70),
      textColor: AppColors.red,
      onPressed: () {
        Get.back(); // Close Dialog
        onConfirm();
      },
    );
  }

  // Secondary Button (Cancel)
  Widget _buildSecondaryButton(String text) {
    return AppButton(
      height: 42.px,
      text: text,
      fontSize: 14.sp,
      backgroundColor: AppColors.white.withValues(alpha: 0.20),
      borderColor: AppColors.white,
      textColor: AppColors.white,
      onPressed: () {
        Get.back();
        if (onCancel != null) onCancel!();
      },
    );
  }
}