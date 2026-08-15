import '../../../config/barrel.dart';

class GeneralTabView extends StatelessWidget {
  const GeneralTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 1.h),
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
          onTap: () {
          },
        ),
        SizedBox(height: 2.5.h),
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
        SizedBox(height: 3.6.h),
      ],
    );
  }
}
