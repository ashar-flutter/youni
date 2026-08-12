import '../../../config/barrel.dart';

Widget onTap({
  required Widget child,
  VoidCallback? onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    behavior: HitTestBehavior.opaque,
    child: child,
  );
}