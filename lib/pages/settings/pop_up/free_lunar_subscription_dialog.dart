import '../../../config/barrel.dart';

class FreeLunarSubscriptionDialog extends StatelessWidget {
  const FreeLunarSubscriptionDialog({super.key});

  static Future<void> show() {
    return Get.dialog(
      const FreeLunarSubscriptionDialog(),
      barrierColor: AppColors.dark.withValues(alpha: 0.85),
      transitionCurve: Curves.easeInOut,
      transitionDuration: const Duration(milliseconds: 250),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 3.h),
      child: Center(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            width: 90.w,
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.2.h),
            decoration: BoxDecoration(
              color: AppColors.blue.withValues(alpha: 0.02),
              borderRadius: BorderRadius.circular(26.px),
              border: Border.all(color: AppColors.blue, width: 2.px),
              boxShadow: [
                BoxShadow(
                  color: AppColors.blue.withValues(alpha: 0.15),
                  blurRadius: 16.px,
                  spreadRadius: 2.px,
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header Row
                Row(
                  children: [
                    Image.asset(
                      AppImage.paymentIcon,
                      width: 22.px,
                      height: 22.px,
                      errorBuilder: (_, _, _) =>
                          Icon(Icons.credit_card_rounded, size: 20.px),
                    ),
                    SizedBox(width: 8.px),
                    CustomText('Secure Payment'),
                  ],
                ),
                SizedBox(height: 0.6.h),

                CustomText(
                  'Complete your Free Lunar subscription',
                  fontSize: 11.px,
                  color: AppColors.white.withValues(alpha: 0.70),
                  fontWeight: FontWeight.w400,
                ),
                SizedBox(height: 2.6.h),

                // Plan Info Card
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                  decoration: BoxDecoration(
                    color: AppColors.blue.withValues(alpha: 0.10),
                    borderRadius: BorderRadius.circular(14.px),
                    border: Border.all(
                      color: AppColors.blue.withValues(alpha: 0.20),
                      width: 0.67.px,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            'Free Lunar Plan',
                            fontSize: 13.px,
                            fontWeight: FontWeight.w600,
                          ),
                          SizedBox(height: 0.4.h),
                          CustomText(
                            '30 Days Free, then \$9.99/mo',
                            fontSize: 10.px,
                            fontWeight: FontWeight.w400,
                            color: AppColors.white.withValues(alpha: 0.70),
                          ),
                        ],
                      ),
                      CustomText('\$0.00', fontSize: 16.5.sp),
                    ],
                  ),
                ),
                SizedBox(height: 2.4.h),

                AppTextField(
                  labelGap: 1.3.h,
                  labelSize: 11.px,
                  labelText: "Cardholder Name",
                  hintText: 'John Doe',
                  fillColor: AppColors.white.withValues(alpha: 0.05),
                  borderColor: AppColors.white.withValues(alpha: 0.10),
                  hintColor: AppColors.white.withValues(alpha: 0.70),
                  height: 40.px,
                  textSize: 11.px,
                  hintSize: 11.px,
                ),
                SizedBox(height: 2.5.h),

                AppTextField(
                  labelGap: 1.3.h,
                  labelSize: 11.px,
                  labelText: "Cardholder Name",
                  fillColor: AppColors.white.withValues(alpha: 0.05),
                  borderColor: AppColors.white.withValues(alpha: 0.10),
                  hintColor: AppColors.white.withValues(alpha: 0.70),
                  height: 40.px,
                  textSize: 11.px,
                  hintSize: 11.px,
                  hintText: '0000 0000 0000 0000',
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 0,
                    horizontal: 2.w,
                  ),
                  prefixIconConstraints: BoxConstraints(
                    minWidth: 9.w,
                    minHeight: 40.px,
                  ),
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(left: 3.w, right: 1.5.w),
                    child: Icon(
                      Icons.credit_card_rounded,
                      size: 14.px,
                      color: AppColors.white.withValues(alpha: 0.40),
                    ),
                  ),
                ),
                SizedBox(height: 2.8.h),

                // Expiry & CVC Row
                Row(
                  children: [
                    Expanded(
                      child: AppTextField(
                        labelGap: 1.3.h,
                        labelSize: 11.px,
                        labelText: "Expiry Date",
                        fillColor: AppColors.white.withValues(alpha: 0.05),
                        borderColor: AppColors.white.withValues(alpha: 0.10),
                        hintColor: AppColors.white.withValues(alpha: 0.70),
                        height: 39.px,
                        textSize: 11.px,
                        hintSize: 11.px,
                        hintText: 'MM/YY',
                      ),
                    ),
                    SizedBox(width: 3.w),
                    Expanded(
                      child: AppTextField(
                        labelGap: 1.3.h,
                        labelSize: 11.px,
                        labelText: "CVC",
                        fillColor: AppColors.white.withValues(alpha: 0.05),
                        borderColor: AppColors.white.withValues(alpha: 0.10),
                        hintColor: AppColors.white.withValues(alpha: 0.70),
                        height: 39.px,
                        textSize: 11.px,
                        hintSize: 11.px,
                        hintText: '123',
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 2.4.h),

                // Security Note
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.verified_user_outlined,
                      size: 13.px,
                      color: AppColors.white.withValues(alpha: 0.45),
                    ),
                    SizedBox(width: 1.6.w),
                    CustomText(
                      fontWeight: FontWeight.w400,
                      'Payments are secure and encrypted',
                      fontSize: 10.px,
                      color: AppColors.white.withValues(alpha: 0.40),
                    ),
                  ],
                ),
                SizedBox(height: 2.5.h),

                // Action Buttons Row
                Row(
                  children: [
                    Expanded(
                      child: onTap(
                        onTap: () => Get.back(),
                        child: Center(
                          child: CustomText(
                            'Back',
                            fontSize: 12.px,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 3.w),
                    Expanded(
                      flex: 2,
                      child: AppButton(
                        height: 38.px,
                        text: 'Start 30-Day Free Trial',
                        fontSize: 11.px,
                        backgroundColor: AppColors.blue,
                        textColor: AppColors.white,
                        borderRadius: 14,
                        onPressed: () => Get.back(),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 2.h),

                // Bottom Disclaimer
                Center(
                  child: CustomText(
                    'You won\'t be charged today. Cancel anytime before\ntrial ends.',
                    fontSize: 9.5.px,
                    color: AppColors.white.withValues(alpha: 0.60),
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 1.h,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
