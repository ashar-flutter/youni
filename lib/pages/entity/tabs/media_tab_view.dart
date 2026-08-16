import '../../../config/barrel.dart';

class MediaTabView extends StatelessWidget {
  const MediaTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Top Header Row with Expanded text column
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 1.h,),
                  CustomText(
                    'Attached Files',
                    fontSize: 13.px,
                  ),
                  SizedBox(height: 2.px),
                  CustomText(
                    'Supported: PDF, Images, Video',
                    fontSize: 9.px,
                    color: AppColors.white.withValues(alpha: 0.5),
                    maxLines: 1,
                  ),
                ],
              ),
            ),
            SizedBox(width: 8.px),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.px, vertical: 6.px),
              decoration: BoxDecoration(
                color: AppColors.blue,
                borderRadius: BorderRadius.circular(9.px),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.black.withValues(alpha: 0.10),
                      offset: Offset(0, 2.71),
                      blurRadius: 4.07,
                      spreadRadius: -2.71,
                    ),
                    BoxShadow(
                      color: AppColors.black.withValues(alpha: 0.10),
                      offset: Offset(0, 6.78),
                      blurRadius: 10.18,
                      spreadRadius: -2.04,
                    ),
                  ],
                border: Border.all(
                  color: AppColors.white.withValues(alpha: 0.05),

                )
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.add, size: 12.px, color: AppColors.white),
                  SizedBox(width: 4.px),
                  CustomText(
                    'Upload File',
                    fontSize: 10.px,
                  ),
                ],
              ),
            ),
          ],
        ),

        SizedBox(height: 4.h),

        // Attachment Area
        Container(
          margin: EdgeInsets.symmetric(horizontal: 2.w),
          height: 180.px,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.greyDark,
            borderRadius: BorderRadius.circular(20.px),
            border: Border.all(
              color: AppColors.white.withValues(alpha: 0.05),
              width: 2
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(12.px),
                decoration: BoxDecoration(
                  color: AppColors.dark.withValues(alpha: 0.10),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.attach_file,
                  size: 25.px,
                  color: AppColors.white.withValues(alpha: 0.40),
                ),
              ),
              SizedBox(height: 1.h),
              CustomText(
                'No attachments yet',
                fontSize: 12.px,
                color: AppColors.white.withValues(alpha: 0.60),
              ),
              SizedBox(height: 0.4.h),
              CustomText(
                'Upload relevant documents and media',
                fontSize: 9.px,
                color: AppColors.white.withValues(alpha: 0.40),
              ),
            ],
          ),
        ),
        SizedBox(height: 15.5.h,),
      ],
    );
  }
}