import '../../../config/barrel.dart';

class ToDoListTabView extends StatelessWidget {
  const ToDoListTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 0.5.h,),
        Row(
          children: [
            Expanded(
              child: AppTextField(
                borderColor: Colors.transparent,
                fillColor: AppColors.greyDark,
                height: 40.px,
                hintText: 'Add a new task...',
                hintColor: AppColors.white.withValues(alpha: 0.40),
                hintSize: 12.px,
                textSize: 12.px,
              ),
            ),
            SizedBox(width: 2.5.w),
            Container(
              width: 40.px,
              height: 40.px,
              decoration: BoxDecoration(
                color: AppColors.blue,
                borderRadius: BorderRadius.circular(12.px),
              ),
              child: Icon(Icons.add, color: AppColors.white, size: 15.px),
            ),
          ],
        ),
        SizedBox(height: 15.h),
        // Image Icon implementation from AppImage
        Image.asset(
          AppImage.checkBoxIcon,
          width: 45.px,
          height: 45.px,
          color: AppColors.white.withValues(alpha: 0.25),
          errorBuilder: (_, _, _) => Icon(
            Icons.check_box_outlined,
            size: 38.px,
            color: AppColors.white.withValues(alpha: 0.25),
          ),
        ),
        SizedBox(height: 1.5.h),
        CustomText('To do list is empty',
            fontSize: 13.px, color: AppColors.white.withValues(alpha: 0.40)),

      SizedBox(height: 18.h,)
      ],
    );
  }
}