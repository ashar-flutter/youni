import '../../../config/barrel.dart';

class FeatureIcon extends StatelessWidget {
  final String iconPath;
  final Color color;
  final double? size;
  final double? iconSize;

  const FeatureIcon({
    super.key,
    required this.iconPath,
    required this.color,
    this.size,
    this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size ?? 10.5.w,
      height: size ?? 10.5.w,
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: color.withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: Center(
        child: Image.asset(
          iconPath,
          width: iconSize ?? 5.3.w,
          height: iconSize ?? 5.3.w,
          fit: BoxFit.contain,
          color: color,
        ),
      ),
    );
  }
}