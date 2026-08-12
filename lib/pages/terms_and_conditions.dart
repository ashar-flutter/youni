import '../config/barrel.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  static const List<Map<String, dynamic>> _sections = [
    {
      'number': '1',
      'icon': Icons.description_outlined,
      'color': AppColors.primary,
      'title': 'Acceptance of Terms',
      'content':
          'By accessing and using Celestial Project Manager, you accept and agree to be bound by the terms and provision of this agreement.',
      'bullets': <String>[],
    },
    {
      'number': '2',
      'icon': Icons.brush_outlined,
      'color': AppColors.purple,
      'title': 'Use License',
      'content':
          'Permission is granted to temporarily download one copy of the materials for personal, non-commercial transitory viewing only.',
      'bullets': [
        'Modify or copy the materials',
        'Use the materials for any commercial purpose',
        'Attempt to decompile or reverse engineer any software contained in the website',
      ],
    },
    {
      'number': '3',
      'icon': Icons.info_outline_rounded,
      'color': AppColors.orange,
      'title': 'Disclaimer',
      'content':
          'The materials on Celestial Project Manager\'s website are provided on an "as is" basis. We make no warranties, expressed or implied, and hereby disclaim all other warranties including, without limitation, implied warranties or conditions of merchantability.',
      'bullets': <String>[],
    },
    {
      'number': '4',
      'icon': Icons.balance_outlined,
      'color': AppColors.gold,
      'title': 'Governing Law',
      'content':
          'These terms and conditions are governed by and construed in accordance with the laws of your state, and you irrevocably submit to the exclusive jurisdiction of the courts in that State.',
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
              title: 'Terms & Conditions',
              subtitle: 'Last updated: January 2025',
            ),

            SizedBox(height: 2.5.h),

            Expanded(
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemCount: _sections.length,
                separatorBuilder: (context, index) => SizedBox(height: 3.h),
                itemBuilder: (context, index) {
                  final section = _sections[index];

                  return _TermsSectionCard(
                    number: section['number'] as String,
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

class _TermsSectionCard extends StatelessWidget {
  final String number;
  final IconData icon;
  final Color iconColor;
  final String title;
  final String content;
  final List<String> bullets;

  const _TermsSectionCard({
    required this.number,
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
          // Header
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 10.w,
                height: 10.w,
                decoration: BoxDecoration(
                  color: iconColor.withValues(alpha: 0.15),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, size: 5.w, color: iconColor),
              ),

              SizedBox(width: 4.w),

              Expanded(child: CustomText('$number. $title')),
            ],
          ),

          SizedBox(height: 0.5.h),

          // Main Content
          Padding(
            padding: EdgeInsets.fromLTRB(15.w, 0, 1.w, 0),
            child: CustomText(
              content,
              fontSize: 15.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.white.withValues(alpha: 0.55),
              height: 1.5,
            ),
          ),

          // Bullet List
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
