import '../../../config/barrel.dart';

enum SettingPopUpType { logout, deleteAccount, cancelSubscription }

class SettingPopUp extends StatelessWidget {
  final SettingPopUpType type;
  final VoidCallback onConfirm;
  final VoidCallback? onCancel;

  const SettingPopUp({
    super.key,
    required this.type,
    required this.onConfirm,
    this.onCancel,
  });

  static Future<void> show({
    required SettingPopUpType type,
    required VoidCallback onConfirm,
    VoidCallback? onCancel,
  }) {
    return Get.dialog(
      SettingPopUp(type: type, onConfirm: onConfirm, onCancel: onCancel),
      barrierColor: AppColors.dark.withValues(alpha: 0.90),
      transitionCurve: Curves.easeInOut,
      transitionDuration: const Duration(milliseconds: 250),
    );
  }

  @override
  Widget build(BuildContext context) {
    final String title = _getTitle();
    final String subtitle = _getSubtitle();
    final String confirmText = _getConfirmText();
    final String cancelText = _getCancelText();
    final bool isRedOnLeft = type != SettingPopUpType.cancelSubscription;

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
              title,
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
            ),
            SizedBox(height: 1.2.h),

            // Subtitle
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.w),
              child: CustomText(
                subtitle,
                fontSize: 13.sp,
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 3.h),

            // Conditional Action Buttons Row
            Row(
              children: [
                Expanded(
                  child: isRedOnLeft
                      ? _buildRedButton(confirmText)
                      : _buildSecondaryButton(cancelText),
                ),
                SizedBox(width: 3.w),
                Expanded(
                  child: isRedOnLeft
                      ? _buildSecondaryButton(cancelText)
                      : _buildRedButton(confirmText),
                ),
              ],
            ),
            SizedBox(height: 0.5.h),
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

  // Secondary Button (Cancel / Stay)
  Widget _buildSecondaryButton(String text) {
    return AppButton(
      height: 42.px,
      text: text,
      fontSize: 14.sp,
      backgroundColor: AppColors.white.withValues(alpha: 0.20),
      borderColor: AppColors.white,
      textColor: AppColors.white,
      onPressed: () {
        Get.back(); // Close Dialog
        if (onCancel != null) onCancel!();
      },
    );
  }

  // Text Resolvers
  String _getTitle() {
    switch (type) {
      case SettingPopUpType.logout:
        return 'Logout';
      case SettingPopUpType.deleteAccount:
        return 'Delete Account';
      case SettingPopUpType.cancelSubscription:
        return 'Cancel Subscription';
    }
  }

  String _getSubtitle() {
    switch (type) {
      case SettingPopUpType.logout:
        return 'Are you sure you want to logout?';
      case SettingPopUpType.deleteAccount:
        return 'Are you sure you want to delete account permanently?';
      case SettingPopUpType.cancelSubscription:
        return 'Are you sure you want to cancel your subscription?\nYou will be downgraded to the free plan at the end of billing period.';
    }
  }

  String _getConfirmText() {
    switch (type) {
      case SettingPopUpType.logout:
        return 'Yes, Logout';
      case SettingPopUpType.deleteAccount:
        return 'Yes, Delete';
      case SettingPopUpType.cancelSubscription:
        return 'Downgrade';
    }
  }

  String _getCancelText() {
    switch (type) {
      case SettingPopUpType.cancelSubscription:
        return 'Stay';
      default:
        return 'Cancel';
    }
  }
}
