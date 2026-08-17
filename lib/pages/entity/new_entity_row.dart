import '../../config/barrel.dart';

class NewEntityRow extends StatelessWidget {
  const NewEntityRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 7.w),
      child: SizedBox(
        width: 100.w,
        child: Row(
          children: [
            // 1. Search Field - Slightly wider
            Expanded(
              flex: 143,
              child: AppTextField(
                height: 40.px,
                fillColor: AppColors.greyDark.withValues(alpha: 0.67),
                hintText: 'Search',
                hintColor: AppColors.white.withValues(alpha: 0.4),
                borderColor: AppColors.greyDark,
                borderRadius: 12,

                contentPadding: EdgeInsets.only(top: 1.2.w),
                prefixIcon: Padding(
                  padding: EdgeInsets.only(left: 3.2.w, right: 0.6.w),
                  child: Icon(
                    Icons.search_rounded,
                    color: AppColors.white.withValues(alpha: 0.4),
                    size: 24.px,
                  ),
                ),

                prefixIconConstraints: const BoxConstraints(
                  minWidth: 0,
                  minHeight: 0,
                ),
              ),
            ),

            SizedBox(width: 3.3.w),

            // 2. Create Button
            Expanded(
              flex: 100,
              child: AppButton(
                height: 40.px,
                borderRadius: 13,
                text: 'Create New Entity',
                onPressed: () {
                  CreateNewEntityDialog.show(context);
                },
                borderColor: AppColors.primary,
                backgroundColor: AppColors.dark,
                fontSize: 13.5.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
