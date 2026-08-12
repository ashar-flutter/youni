import '../../../config/barrel.dart';

enum CustomFont { inter, roboto, poppins, manrope }

class CustomText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight fontWeight;
  final Color color;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final double? height;
  final double? letterSpacing;
  final FontStyle? fontStyle;
  final TextDecoration? decoration;
  final Color? decorationColor;

  /// Default = Inter
  final CustomFont font;

  const CustomText(
      this.text, {
        super.key,
        this.fontSize,
        this.fontWeight = FontWeight.w600,
        this.color = AppColors.white,
        this.textAlign,
        this.overflow,
        this.maxLines,
        this.height,
        this.letterSpacing,
        this.fontStyle,
        this.decoration,
        this.decorationColor,
        this.font = CustomFont.inter,
      });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      style: _textStyle(),
    );
  }

  TextStyle _textStyle() {
    switch (font) {
      case CustomFont.inter:
        return GoogleFonts.inter(
          fontSize: fontSize ?? 16.sp,
          fontWeight: fontWeight,
          color: color,
          height: height,
          letterSpacing: letterSpacing,
          fontStyle: fontStyle,
          decoration: decoration,
          decorationColor: decorationColor,
        );

      case CustomFont.roboto:
        return GoogleFonts.roboto(
          fontSize: fontSize ?? 16.sp,
          fontWeight: fontWeight,
          color: color,
          height: height,
          letterSpacing: letterSpacing,
          fontStyle: fontStyle,
          decoration: decoration,
          decorationColor: decorationColor,
        );

      case CustomFont.poppins:
        return GoogleFonts.poppins(
          fontSize: fontSize ?? 16.sp,
          fontWeight: fontWeight,
          color: color,
          height: height,
          letterSpacing: letterSpacing,
          fontStyle: fontStyle,
          decoration: decoration,
          decorationColor: decorationColor,
        );

      case CustomFont.manrope:
        return GoogleFonts.manrope(
          fontSize: fontSize ?? 16.sp,
          fontWeight: fontWeight,
          color: color,
          height: height,
          letterSpacing: letterSpacing,
          fontStyle: fontStyle,
          decoration: decoration,
          decorationColor: decorationColor,
        );
    }
  }
}