import '../config/barrel.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  static const List<Map<String, dynamic>> _sections = [
    {
      'icon': Icons.shield_outlined,
      'color': AppColors.blue,
      'title': '1. Information We Collect',
      'content':
      'At Celestial Project Manager, we take your privacy seriously. The information we collect is strictly limited to what is necessary for the functionality of our service.',
      'bullets': [
        'Account information (email, name) for authentication purposes.',
        'Project data (Stars, Planets, Satellites) you explicitly create.',
        'Usage data to improve our cosmic interface.',
      ],
    },
    {
      'icon': Icons.lock_outline,
      'color': AppColors.purple,
      'title': '2. How We Use Your Data',
      'content':
      'Your data is used solely to provide and improve the project management services. We do not sell your personal data to third parties. Your cosmic entities remain yours.',
      'bullets': <String>[],
    },
    {
      'icon': Icons.dns_outlined,
      'color': AppColors.green,
      'title': '3. Data Storage & Security',
      'content':
      'We employ industry-standard encryption protocols to ensure your data travels safely through the digital void. All data is stored in secure, redundant servers.',
      'bullets': <String>[],
    },
    {
      'icon': Icons.remove_red_eye_outlined,
      'color': AppColors.gold,
      'title': '4. Your Rights',
      'content':
      'You have the right to access, correct, or delete your personal data at any time. Contact our support team to exercise these rights.',
      'bullets': <String>[],
    },
  ];

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
              title: 'Privacy Policy',
              subtitle: 'Effective Date: January 21, 2026',
            ),
            SizedBox(height: 2.5.h),
            Expanded(
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemCount: _sections.length,
                separatorBuilder: (context, index) => SizedBox(height: 3.h),
                itemBuilder: (context, index) {
                  final section = _sections[index];
                  return _PolicySectionCard(
                    icon: section['icon'] as IconData,
                    iconColor: section['color'] as Color,
                    title: section['title'] as String,
                    content: section['content'] as String,
                    bullets: section['bullets'] as List<String>,
                  );
                },
              ),
            ),
            SizedBox(height: 3.h),
          ],
        ),
      ),
    );
  }
}

class _PolicySectionCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String content;
  final List<String> bullets;

  const _PolicySectionCard({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.content,
    required this.bullets,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsGeometry.symmetric(horizontal: 7.w),
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 5.5.w, vertical: 2.5.h),
      decoration: BoxDecoration(
        color: AppColors.darkBackground,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(
          color: AppColors.white.withValues(alpha: 0.10),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 10.w,
                height: 10.w,
                decoration: BoxDecoration(
                  color: iconColor.withValues(alpha: 0.15),
                  shape: BoxShape.circle

                ),
                child: Icon(icon, size: 5.w, color: iconColor),
              ),
              SizedBox(width: 4.w),
              Expanded(
                child: CustomText(
                  title,
                ),
              ),
            ],
          ),
          SizedBox(height: 0.5.h),
          Padding(
            padding:  EdgeInsets.fromLTRB(15.w, 0,1.w,0),
            child: CustomText(
              content,
              fontSize: 15.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.white.withValues(alpha: 0.55),
              height: 1.5,
            ),
          ),
          if (bullets.isNotEmpty) ...[
            SizedBox(height: 1.6.h),

            for (final bullet in bullets)
              Padding(
                padding: EdgeInsets.fromLTRB(15.w, 0, 1.w, 1.2.h),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 0.9.h),
                      child: Container(
                        width: 1.3.w,
                        height: 1.3.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: iconColor.withValues(alpha: 0.7),
                        ),
                      ),
                    ),
                    SizedBox(width: 3.w),
                    Expanded(
                      child: CustomText(
                        bullet,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.white.withValues(alpha: 0.55),
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ],
      ),
    );
  }
}