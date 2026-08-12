import '../../../config/barrel.dart';

class CustomScaffold extends StatelessWidget {
  final Widget body;
  final bool resizeToAvoidBottomInset;
  final bool showBackground;

  const CustomScaffold({
    super.key,
    required this.body,
    this.resizeToAvoidBottomInset = true,
    this.showBackground = true,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      body: Container(
        width: double.infinity,
        decoration: showBackground
            ? _backgroundDecoration
            : null,
        child: body,
      ),
    );
  }

  static const BoxDecoration _backgroundDecoration = BoxDecoration(
    image: DecorationImage(
      image: AssetImage(AppImage.appBackground),
      fit: BoxFit.cover,
    ),
  );
}