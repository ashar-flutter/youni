import '../../../config/barrel.dart';

class MediaTabView extends StatelessWidget {
  final bool isSelectionMode;

  const MediaTabView({
    super.key,
    this.isSelectionMode = false,
  });

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
                  SizedBox(height: 1.h),
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
                    offset: const Offset(0, 2.71),
                    blurRadius: 4.07,
                    spreadRadius: -2.71,
                  ),
                  BoxShadow(
                    color: AppColors.black.withValues(alpha: 0.10),
                    offset: const Offset(0, 6.78),
                    blurRadius: 10.18,
                    spreadRadius: -2.04,
                  ),
                ],
                border: Border.all(
                  color: AppColors.white.withValues(alpha: 0.05),
                ),
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

        // Attachment Area Container
        Container(
          margin: EdgeInsets.symmetric(horizontal: 2.w),
          height: 180.px,
          width: double.infinity,
          clipBehavior: Clip.antiAlias, // Ensures clean rounded clipping
          decoration: BoxDecoration(
            color: AppColors.greyDark,
            borderRadius: BorderRadius.circular(20.px),
            border: Border.all(
              color: AppColors.white.withValues(alpha: 0.08), // Soft border to fix double edge
              width: 1.5.px,
            ),
          ),
          child: isSelectionMode
              ? ClipRRect(
            borderRadius: BorderRadius.circular(18.px),
            child: Stack(
              fit: StackFit.expand,
              children: [
                // Network Image
                Image.network(
                  'https://images.unsplash.com/photo-1568667256549-094345857637?q=80&w=1000&auto=format&fit=crop',
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: AppColors.greyDark,
                      child: Center(
                        child: Icon(
                          Icons.picture_as_pdf_rounded,
                          size: 40.px,
                          color: AppColors.white.withValues(alpha: 0.5),
                        ),
                      ),
                    );
                  },
                ),

                // Smooth Gradient Overlay
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppColors.black.withValues(alpha: 0.15),
                        AppColors.black.withValues(alpha: 0.60),
                      ],
                    ),
                  ),
                ),

                // PDF Tag Indicator
                Positioned(
                  bottom: 12.px,
                  left: 12.px,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.px,
                      vertical: 5.px,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.charcoal.withValues(alpha: 0.85),
                      borderRadius: BorderRadius.circular(8.px),
                      border: Border.all(
                        color: AppColors.white.withValues(alpha: 0.15),
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.picture_as_pdf_rounded,
                          size: 14.px,
                          color: AppColors.red,
                        ),
                        SizedBox(width: 6.px),
                        CustomText(
                          'Document_Preview.pdf',
                          fontSize: 10.px,
                          color: AppColors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
              : Column(
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

        SizedBox(height: 15.5.h),
      ],
    );
  }
}