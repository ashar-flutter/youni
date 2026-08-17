import '../config/barrel.dart';

class PlanButton extends StatefulWidget {
  final String text;
  final Future<void> Function()? onInitialTap;
  final VoidCallback? onCancelConfirm;
  final double? width;
  final double? height;

  const PlanButton({
    super.key,
    this.text = 'Current Plan',
    this.onInitialTap,
    this.onCancelConfirm,
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

  Future<void> _handleTap() async {
    if (!_isCancelMode) {
      // Step 1: Open Subscription Dialog and wait until closed/backed
      if (widget.onInitialTap != null) {
        await widget.onInitialTap!();
      }

      // Step 2: On returning back, set state to 'Cancel Subscription'
      if (mounted) {
        setState(() {
          _isCancelMode = true;
        });
      }
    } else {
      // Step 3: Trigger Cancel Subscription Pop-Up
      SettingPopUp.show(
        type: SettingPopUpType.cancelSubscription,
        onConfirm: () {
          _resetButtonState();
          if (widget.onCancelConfirm != null) widget.onCancelConfirm!();
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
        AppColors.black,
      ],
    )
        : const LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        AppColors.blue,
        AppColors.magenta,
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