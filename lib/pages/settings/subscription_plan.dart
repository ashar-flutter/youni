import '../../config/barrel.dart';

class SubscriptionPlan extends StatelessWidget {
  const SubscriptionPlan({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Column(
            children: [
              const LegalPageAppBar(
                title: "Your Youni Journey",
                subtitle: "Subscription Information",
                showDivider: false,
                subtitleColor: AppColors.white,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.w),
                child: Column(
                  children: [
                    SizedBox(height: 5.h),

                    // FIRST CARD: Free Lunar
                    const LunarCard(showPlanButton: true),

                    SizedBox(height: 6.h),

                    // SECOND CARD: Youni Pro
                    const PopularCard(showPlanButton: true),

                    SizedBox(height: 5.h),

                    // SECURE & ENCRYPTED BADGE
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 6.w,
                        vertical: 0.8.h,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.green.withValues(alpha: 0.08),
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: AppColors.green.withValues(alpha: 0.50),
                          width: 1.5,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.shield_moon_outlined,
                            color: AppColors.green,
                            size: 5.w,
                          ),
                          SizedBox(width: 2.5.w),
                          CustomText(
                            'SECURE & ENCRYPTED',
                            fontSize: 14.sp,
                            color: AppColors.green,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 1.1,
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 2.5.h),

                    // FOOTER STRIPE TEXT
                    CustomText(
                      'Payments processed securely by Stripe. We do\nnot store your card details.',
                      fontSize: 13.5.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.white.withValues(alpha: 0.50),
                      textAlign: TextAlign.center,
                      height: 1.4,
                    ),

                    SizedBox(height: 5.h),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}