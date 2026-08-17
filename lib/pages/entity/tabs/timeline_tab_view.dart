import '../../../config/barrel.dart';

class TimelineTabView extends StatefulWidget {
  final bool isSelectionMode;

  const TimelineTabView({
    super.key,
    this.isSelectionMode = false,
  });

  @override
  State<TimelineTabView> createState() => _TimelineTabViewState();
}

class _TimelineTabViewState extends State<TimelineTabView> {
  late int _selectedStatus;
  bool _emailRemindersEnabled = false;

  @override
  void initState() {
    super.initState();
    _selectedStatus = widget.isSelectionMode ? 1 : 0;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 1.h),
        if (widget.isSelectionMode) ...[
          Align(
            alignment: Alignment.centerRight,
            child: onTap(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 12.px,
                  vertical: 4.px,
                ),
                decoration: BoxDecoration(
                  color: AppColors.charcoal,
                  borderRadius: BorderRadius.circular(16.px),
                  border: Border.all(
                    color: AppColors.white.withValues(alpha: 0.20),
                    width: 1.px,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.edit_outlined,
                      size: 11.px,
                      color: AppColors.white,
                    ),
                    SizedBox(width: 4.px),
                    CustomText(
                      'Edit',
                      fontSize: 10.px,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 1.h),
        ],

        // Dates Row
        Row(
          children: [
            Expanded(
              child: AppTextField(
                hintColor: AppColors.white.withValues(alpha: 0.50),
                borderColor: Colors.transparent,
                labelGap: 1.5.h,
                labelText: "Start Date",
                labelSize: 12.px,
                fillColor: AppColors.greyDark,
                height: 40.px,
                hintText: 'DD/MM/YYYY',
                hintSize: 12.px,
                textSize: 12.px,
              ),
            ),
            SizedBox(width: 3.w),
            Expanded(
              child: AppTextField(
                hintColor: AppColors.white.withValues(alpha: 0.50),
                borderColor: Colors.transparent,
                labelGap: 1.5.h,
                labelText: "End Date",
                labelSize: 12.px,
                fillColor: AppColors.greyDark,
                height: 40.px,
                hintText: 'DD/MM/YYYY',
                hintSize: 12.px,
                textSize: 12.px,
              ),
            ),
          ],
        ),
        SizedBox(height: 2.h),

        CustomText(
          'Initial Status',
          fontSize: 12.px,
          fontWeight: FontWeight.w500,
        ),
        SizedBox(height: 1.5.h),

        // Status Cards Row
        Row(
          children: [
            // Not Started Container
            Expanded(
              child: onTap(
                onTap: () => setState(() => _selectedStatus = 0),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: EdgeInsets.symmetric(
                    horizontal: 8.px,
                    vertical: 8.px,
                  ),
                  decoration: BoxDecoration(
                    color: _selectedStatus == 0
                        ? AppColors.red.withValues(alpha: 0.12)
                        : AppColors.greyDark,
                    borderRadius: BorderRadius.circular(12.px),
                    border: Border.all(
                      color: _selectedStatus == 0
                          ? AppColors.red
                          : Colors.transparent,
                      width: 1.2,
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 8.px,
                        height: 8.px,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _selectedStatus == 0
                              ? AppColors.red
                              : AppColors.white.withValues(alpha: 0.3),
                        ),
                      ),
                      SizedBox(width: 7.px),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText(
                              'Not Started',
                              fontSize: 11.px,
                            ),
                            SizedBox(height: 2.px),
                            CustomText(
                              'Appears as Red Star',
                              fontSize: 8.px,
                              color: AppColors.white.withValues(alpha: 0.70),
                              maxLines: 1,
                              fontWeight: FontWeight.w400,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(width: 2.2.w),

            // In Progress Container
            Expanded(
              child: onTap(
                onTap: () => setState(() => _selectedStatus = 1),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: EdgeInsets.symmetric(
                    horizontal: 8.px,
                    vertical: 8.px,
                  ),
                  decoration: BoxDecoration(
                    color: _selectedStatus == 1
                        ? AppColors.green.withValues(alpha: 0.12)
                        : AppColors.greyDark,
                    borderRadius: BorderRadius.circular(12.px),
                    border: Border.all(
                      color: _selectedStatus == 1
                          ? AppColors.green
                          : Colors.transparent,
                      width: 1.2,
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 9.px,
                        height: 9.px,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _selectedStatus == 1
                              ? AppColors.green
                              : AppColors.white.withValues(alpha: 0.3),
                        ),
                      ),
                      SizedBox(width: 7.px),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText(
                              'In Progress',
                              fontSize: 11.px,
                            ),
                            SizedBox(height: 2.px),
                            CustomText(
                              'Appears as Green Star',
                              fontSize: 8.px,
                              color: AppColors.white.withValues(alpha: 0.70),
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 2.5.h),

        // Email Reminders Container
        Container(
          padding: EdgeInsets.symmetric(vertical: 6.px),
          decoration: BoxDecoration(
            color: AppColors.greyDark,
            borderRadius: BorderRadius.circular(15.px),
          ),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 3.w),
                padding: EdgeInsets.all(8.px),
                decoration: BoxDecoration(
                  color: AppColors.blue.withValues(alpha: 0.10),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.access_time,
                  size: 16.px,
                  color: AppColors.blueBright.withValues(alpha: 0.80),
                ),
              ),
              SizedBox(width: 7.px),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      'Email Reminders',
                      fontSize: 12.px,
                      fontWeight: FontWeight.w400,
                    ),
                    SizedBox(height: 1.2.px),
                    CustomText(
                      maxLines: 1,
                      'Notify when deadlines are approaching',
                      fontSize: 9.px,
                      color: AppColors.white.withValues(alpha: 0.50),
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
              ),
              Transform.scale(
                scale: 0.6,
                child: Switch.adaptive(
                  value: _emailRemindersEnabled,
                  onChanged: (value) {
                    setState(() {
                      _emailRemindersEnabled = value;
                    });
                  },
                  activeTrackColor: AppColors.white,
                  activeThumbColor: AppColors.dark,
                  inactiveTrackColor: AppColors.greyDarkLight,
                  inactiveThumbColor: AppColors.greyLight,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: widget.isSelectionMode ? 12.h : 2.5.h),

        // Missing Dates Alert (ONLY in Normal Mode)
        if (!widget.isSelectionMode) ...[
          Container(
            padding: EdgeInsets.symmetric(vertical: 10.px),
            decoration: BoxDecoration(
              color: AppColors.gold.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(15.px),
              border: Border.all(
                color: AppColors.gold.withValues(alpha: 0.25),
                width: 0.8,
              ),
            ),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 3.w),
                  padding: EdgeInsets.all(8.px),
                  decoration: BoxDecoration(
                    color: AppColors.gold.withValues(alpha: 0.10),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.info_outline,
                    size: 16.px,
                    color: AppColors.gold,
                  ),
                ),
                SizedBox(width: 10.px),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        'Missing Dates',
                        fontSize: 12.px,
                        color: AppColors.gold,
                        fontWeight: FontWeight.w500,
                      ),
                      SizedBox(height: 2.px),
                      CustomText(
                        'Will be saved as Draft. Set dates and set system',
                        fontSize: 8.px,
                        color: AppColors.white.withValues(alpha: 0.80),
                        maxLines: 1,
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],

        SizedBox(height: widget.isSelectionMode ? 2.h : 8.5.h),
      ],
    );
  }
}