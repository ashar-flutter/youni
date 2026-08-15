import '../../config/barrel.dart';

class ToDoCards extends StatelessWidget {
  const ToDoCards({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          const MainAppBar(showPremiumAndFeatures: false),

          SizedBox(height: 3.h),

          const NewEntityRow(),

          SizedBox(height: 3.h),

          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 7.w),
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.2.h),
            decoration: BoxDecoration(
                color: AppColors.charcoal,
              borderRadius: BorderRadius.circular(22),
              border: Border.all(color: AppColors.greyDark, width: 1),
            ),
            child: Column(
              children: [
                SizedBox(height: 2.h),
                const ActiveCard(),
                SizedBox(height: 2.5.h),
                const RecurringCard(),
                SizedBox(height: 2.5.h),
                const CompletedCard(),
                SizedBox(height: 2.h),
              ],
            ),
          ),

          SizedBox(height: 4.h),
        ],
      ),
    );
  }
}
