import '../config/barrel.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      showBackground: true,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const LegalPageAppBar(
              title: 'Contact Us',
              subtitle: 'Effective Date: January 21, 2026',
            ),
            SizedBox(height: 2.5.h),
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  _ContactInfoCard(
                    icon: Icons.mail_outline,
                    iconColor: AppColors.blue,
                    title: 'Electronic Mail',
                    subtitle: 'General inquiries and mission support',
                    value: 'support@celestial.pm',
                  ),
                  SizedBox(height: 3.h),
                  _ContactInfoCard(
                    icon: Icons.phone_in_talk_outlined,
                    iconColor: AppColors.green,
                    title: 'Emergency Uplink',
                    subtitle: 'Urgent technical assistance (24/7)',
                    value: '+1 (800) 555-0123',
                  ),
                  SizedBox(height: 3.h),
                  const _HeadquartersCard(),
                  SizedBox(height: 3.h),
                  const _QuoteCard(),
                  SizedBox(height: 3.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ContactInfoCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String subtitle;
  final String value;

  const _ContactInfoCard({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.subtitle,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsGeometry.symmetric(horizontal: 7.w),
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
      decoration: BoxDecoration(
        color: AppColors.darkBackground,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(
          color: AppColors.white.withValues(alpha: 0.10),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 16.w,
            height: 16.w,
            decoration: BoxDecoration(
              color: iconColor.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: iconColor.withValues(alpha: 0.4),
                width: 1,
              ),
            ),
            child: Icon(icon, size: 7.w, color: iconColor),
          ),
          SizedBox(height: 3.h),
          CustomText(title, fontSize: 17.sp, fontWeight: FontWeight.w700),
          SizedBox(height: 1.4.h),
          CustomText(
            subtitle,
            fontSize: 15.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.white.withValues(alpha: 0.45),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 2.5.h),
          CustomText(value, fontSize: 15.3.sp, color: iconColor),
        ],
      ),
    );
  }
}

class _HeadquartersCard extends StatelessWidget {
  const _HeadquartersCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsGeometry.symmetric(horizontal: 7.w),
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
      decoration: BoxDecoration(
        color: AppColors.darkBackground,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(
          color: AppColors.white.withValues(alpha: 0.08),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Container(
            width: 16.w,
            height: 16.w,
            decoration: BoxDecoration(
              color: AppColors.purple.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: AppColors.purple.withValues(alpha: 0.4),
                width: 1,
              ),
            ),
            child: Icon(
              Icons.location_on_outlined,
              size: 7.w,
              color: AppColors.purple,
            ),
          ),
          SizedBox(height: 3.h),
          CustomText(
            'Global Headquarters',
            fontSize: 17.sp,
            fontWeight: FontWeight.w700,
          ),
          SizedBox(height: 1.4.h),
          CustomText(
            'Nebula Station Alpha, Sector 7G\n1001 Cosmic Way, Orbit Arm\nMilky Way Galaxy, MW 99201',
            fontSize: 15.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.white.withValues(alpha: 0.55),
            textAlign: TextAlign.center,
            height: 1.5,
          ),
          SizedBox(height: 3.3.h),
          onTap(
            onTap: () {},
            child: Container(
              margin: EdgeInsetsGeometry.symmetric(horizontal: 2.w),
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 1.4.h, horizontal: 6.w),
              decoration: BoxDecoration(
                color: AppColors.white.withValues(alpha: 0.06),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: AppColors.white.withValues(alpha: 0.12),
                  width: 1,
                ),
              ),
              child: Row(
                children: [
                  SizedBox(width: 2.w),

                  Icon(
                    Icons.public,
                    size: 6.w,
                    color: AppColors.white.withValues(alpha: 0.55),
                  ),
                  SizedBox(width: 4.w),
                  CustomText(
                    'Earth Division',
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.white.withValues(alpha: 0.65),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: 2.2.h),

          onTap(
            onTap: () {},
            child: Container(
              margin: EdgeInsetsGeometry.symmetric(horizontal: 2.w),
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 1.4.h, horizontal: 5.w),
              decoration: BoxDecoration(
                color: AppColors.white.withValues(alpha: 0.06),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: AppColors.white.withValues(alpha: 0.12),
                  width: 1,
                ),
              ),
              child: Row(
                children: [
                  SizedBox(width: 3.w),

                  Icon(
                    Icons.chat_bubble_outline,
                    size: 6.w,
                    color: AppColors.white.withValues(alpha: 0.55),
                  ),
                  SizedBox(width: 3.w),
                  CustomText(
                    'Available for Visits',
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.white.withValues(alpha: 0.65),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _QuoteCard extends StatelessWidget {
  const _QuoteCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsGeometry.symmetric(horizontal: 7.w),
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: AppColors.purple.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: AppColors.purple.withValues(alpha: 0.15),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          CustomText(
            '"The cosmos is within us.\n'
            'We are made of star-stuff.\n'
            'We are a way for the\n'
            'universe to know itself."',
            fontSize: 17.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.lightBlue.withValues(alpha: 0.8),
            textAlign: TextAlign.center,
            height: 1.35,
            font: CustomFont.manrope,
          ),

          SizedBox(height: 3.h),

          CustomText(
            '— CARL SAGAN',
            fontSize: 15.sp,
            color: AppColors.lightBlue.withValues(alpha: 0.5),
            textAlign: TextAlign.center,
            font: CustomFont.manrope,
            fontWeight: FontWeight.w700,
          ),
        ],
      ),
    );
  }
}
