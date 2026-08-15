import '../../../config/barrel.dart';

class NotesTabView extends StatelessWidget {
  const NotesTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 1.h,),
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
                contentPadding: EdgeInsets.only(bottom: 1.w,
                right: 2.w
                ),
              ),
              Container(
                padding:
                EdgeInsets.symmetric(horizontal: 12.px, vertical: 6.px),
                decoration: BoxDecoration(
                  color: AppColors.blue,
                  borderRadius: BorderRadius.circular(7.px),
                ),
                child: CustomText('Add Note',
                    fontSize: 10.px, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
        SizedBox(height: 7.h),
        Image.asset(AppImage.draftIcon,
        color: AppColors.white.withValues(alpha: 0.40),
          height: 45.px,
          width: 45.px,
        ),
        SizedBox(height: 1.5.h),
        CustomText('No notes recorded',
            fontSize: 13.px, color: AppColors.white.withValues(alpha: 0.25),
        fontWeight: FontWeight.w400,
        ),
        SizedBox(height: 15.h,)
      ],
    );
  }
}