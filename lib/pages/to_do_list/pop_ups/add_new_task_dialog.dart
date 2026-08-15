import '../../../config/barrel.dart';

class AddNewTaskDialog extends StatefulWidget {
  const AddNewTaskDialog({super.key});

  static Future<void> show(BuildContext context) {
    return showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: '',
      barrierColor: Colors.black.withValues(alpha: 0.6),
      transitionDuration: const Duration(milliseconds: 280),
      pageBuilder: (context, animation, secondaryAnimation) {
        return const AddNewTaskDialog();
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        final curved = CurvedAnimation(
          parent: animation,
          curve: Curves.easeOutCubic,
        );
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, 0.08),
            end: Offset.zero,
          ).animate(curved),
          child: FadeTransition(opacity: curved, child: child),
        );
      },
    );
  }

  @override
  State<AddNewTaskDialog> createState() => _AddNewTaskDialogState();
}

class _AddNewTaskDialogState extends State<AddNewTaskDialog> {
  late final TextEditingController _taskNameController;
  late final TextEditingController _descriptionController;
  bool _isRecurring = false;

  @override
  void initState() {
    super.initState();
    _taskNameController = TextEditingController();
    _descriptionController = TextEditingController();
  }

  @override
  void dispose() {
    _taskNameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(horizontal: 11.w),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          width: 90.w,
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          decoration: BoxDecoration(
            color: AppColors.blue.withValues(alpha: 0.05),
            borderRadius: BorderRadius.circular(26),
            border: Border.all(
              color: AppColors.white.withValues(alpha: 0.40),
              width: 0.67,
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.black.withValues(alpha: 0.10),
                offset: Offset(0, 4),
                blurRadius: 6,
                spreadRadius: -4,
              ),
              BoxShadow(
                color: AppColors.black.withValues(alpha: 0.10),
                offset: Offset(0, 10),
                blurRadius: 15,
                spreadRadius: -3,
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              LegalPageAppBar(
                rightPadding: 4.2.w,
                title: 'Add New Task',
                subtitle: '',
                showSubtitle: false,
                showDivider: false,
              ),


              AppTextField(
                borderColor: Colors.transparent,
                labelGap: 1.6.h,
                labelText: "Task Name",
                labelSize: 13.px,
                fillColor: AppColors.greyDark,
                height: 44.px,
                hintText: 'Profession',
                hintSize: 15.sp,
                textSize: 15.sp,
              ),

              SizedBox(height: 3.3.h),

              AppTextField(
                borderColor: Colors.transparent,
                labelSize: 13.px,
                labelGap: 1.6.h,
                labelText: "Description (Optional)",
                controller: _descriptionController,
                fillColor: AppColors.greyDark,
                height: 12.h,
                hintText: 'Add details...',
                hintSize: 15.sp,
                textSize: 15.sp,
                maxLines: 6,
                minLines: 6,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 4.w,
                  vertical: 1.6.h,
                ),
              ),

              SizedBox(height: 3.h),

              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric( vertical: 1.6.h),
                decoration: BoxDecoration(
                  color: AppColors.greyDark,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding:  EdgeInsets.only(left: 4.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              'Recurring Task',
                              fontSize: 15.sp,
                            ),
                            SizedBox(height: 0.4.h),
                            CustomText(
                              'Task will be repeated.',
                              fontSize: 12.px,
                              fontWeight: FontWeight.w400,
                              color: AppColors.white.withValues(alpha: 0.60),
                            ),
                          ],
                        ),
                      ),
                    ),

                    Transform.scale(
                      scale: 0.7,
                      child: Switch.adaptive(
                        value: _isRecurring,
                        onChanged: (val) => setState(() => _isRecurring = val),
                        activeThumbColor: AppColors.white,
                        activeTrackColor: AppColors.blue,
                        inactiveThumbColor: AppColors.white.withValues(alpha: 0.6),
                        inactiveTrackColor: AppColors.white.withValues(alpha: 0.12),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 5.h),

              Row(
                children: [
                  Expanded(
                    child: AppButton(
                      height: 40.px,
                      text: 'Create Task',
                      fontSize: 14.sp,
                      backgroundColor: AppColors.blue,
                      textColor: AppColors.white,
                      borderRadius: 14,
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(width: 3.w),
                  Expanded(
                    child: AppButton(
                      height: 40.px,
                      text: 'Cancel',
                      fontSize: 14.sp,
                      backgroundColor: AppColors.white,
                      textColor: AppColors.dark,
                      borderRadius: 14,
                      onPressed: () => Get.back(),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 3.h),
            ],
          ),
        ),
      ),
    );
  }
}