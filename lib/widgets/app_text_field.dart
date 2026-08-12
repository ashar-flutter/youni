import '../config/barrel.dart';

class AppTextField extends StatefulWidget {
  final String? hintText;
  final String? labelText;
  final TextEditingController? controller;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final double? height;
  final double? borderRadius;
  final Color? borderColor;
  final Color? focusBorderColor;
  final double? borderWidth;
  final double? focusBorderWidth;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final TextStyle? textStyle;
  final Color? hintColor;
  final Color? labelColor;
  final Color? textColor;
  final EdgeInsetsGeometry? contentPadding;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTap;
  final bool? readOnly;
  final int? maxLines;
  final int? minLines;
  final bool? expands;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final bool? autofocus;
  final String? obscuringCharacter;

  const AppTextField({
    super.key,
    this.hintText,
    this.labelText,
    this.controller,
    this.obscureText = false,
    this.keyboardType,
    this.prefixIcon,
    this.suffixIcon,
    this.height,
    this.borderRadius,
    this.borderColor,
    this.focusBorderColor,
    this.borderWidth,
    this.focusBorderWidth,
    this.hintStyle,
    this.labelStyle,
    this.textStyle,
    this.hintColor,
    this.labelColor,
    this.textColor,
    this.contentPadding,
    this.onChanged,
    this.onTap,
    this.readOnly = false,
    this.maxLines = 1,
    this.minLines,
    this.expands = false,
    this.textInputAction,
    this.focusNode,
    this.autofocus = false,
    this.obscuringCharacter = '*',
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late bool _obscureText;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText ?? false;
    _focusNode = widget.focusNode ?? FocusNode();
  }

  @override
  void dispose() {
    if (widget.focusNode == null) {
      _focusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.labelText != null) ...[
          CustomText(
            widget.labelText!,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: widget.labelColor ?? AppColors.white,
          ),
          SizedBox(height: 2.2.h),
        ],
        SizedBox(
          height: widget.height ?? 48.px,
          child: TextField(
            cursorColor: AppColors.white,
            controller: widget.controller,
            obscureText: _obscureText,
            obscuringCharacter: widget.obscuringCharacter ?? '•',
            keyboardType: widget.keyboardType,
            onChanged: widget.onChanged,
            onTap: widget.onTap,
            readOnly: widget.readOnly ?? false,
            maxLines: widget.maxLines,
            minLines: widget.minLines,
            expands: widget.expands ?? false,
            textInputAction: widget.textInputAction,
            focusNode: _focusNode,
            autofocus: widget.autofocus ?? false,
            style:
            widget.textStyle ??
                TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: widget.textColor ?? AppColors.white,
                ),
            decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle:
              widget.hintStyle ??
                  TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: widget.hintColor ?? AppColors.greyMedium,
                  ),
              prefixIcon: widget.prefixIcon != null
                  ? IconTheme(
                data: IconThemeData(color: AppColors.white, size: 20.sp),
                child: widget.prefixIcon!,
              )
                  : null,
              suffixIcon: widget.obscureText == true
                  ? IconTheme(
                data: IconThemeData(color: AppColors.white, size: 20.sp),
                child: IconButton(
                  icon: Icon(
                    _obscureText
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    size: 20.sp,
                    color: AppColors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
              )
                  : widget.suffixIcon != null
                  ? IconTheme(
                data: IconThemeData(color: AppColors.white, size: 20.sp),
                child: widget.suffixIcon!,
              )
                  : null,
              contentPadding:
              widget.contentPadding ??
                  EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.5.h),
              filled: true,
              fillColor: Colors.transparent,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius ?? 12),
                borderSide: BorderSide(
                  color: widget.borderColor ?? AppColors.greyLight,
                  width: widget.borderWidth ?? 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius ?? 12),
                borderSide: BorderSide(
                  color: widget.focusBorderColor ?? AppColors.greyLight,
                  width: widget.focusBorderWidth ?? 1.3,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}