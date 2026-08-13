import '../config/barrel.dart';

class PlanButton extends StatefulWidget {
  final String text;
  final VoidCallback? onTap;
  final double? width;
  final double? height;

  const PlanButton({
    super.key,
    this.text = 'Current Plan',
    this.onTap,
    this.width,
    this.height,
  });

  @override
  State<PlanButton> createState() => _PlanButtonState();
}

class _PlanButtonState extends State<PlanButton> {
  bool _isCancelMode = false;

  void _resetButtonState() {
    if (mounted) {
      setState(() {
        _isCancelMode = false;
      });
    }
  }

  void _handleTap() {
    if (!_isCancelMode) {
      setState(() {
        _isCancelMode = true;
      });
      if (widget.onTap != null) widget.onTap!();
    } else {
      SettingPopUp.show(
        type: SettingPopUpType.cancelSubscription,
        onConfirm: () {
          _resetButtonState();
        },
        onCancel: () {
          _resetButtonState();
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final String displayText = _isCancelMode
        ? 'Cancel Subscription'
        : widget.text;

    final Gradient currentGradient = _isCancelMode
        ? const LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              AppColors.mutedRoseGray,

              AppColors.black],
          )
        : const LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              AppColors.blue,
              AppColors.magenta
            ],
          );

    return Container(
      width: widget.width ?? double.infinity,
      height: widget.height ?? 43.px,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: currentGradient,
        boxShadow: const [
          BoxShadow(
            color: AppColors.deepBlueOverlay,
            offset: Offset(0, 4),
            blurRadius: 6,
            spreadRadius: -4,
          ),
          BoxShadow(
            color: AppColors.deepBlueOverlay,
            offset: Offset(0, 10),
            blurRadius: 15,
            spreadRadius: -3,
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: _handleTap,
          borderRadius: BorderRadius.circular(12),
          child: Center(
            child: CustomText(
              displayText,
              fontSize: 15.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
