import '../../../config/barrel.dart';

class CustomScaffold extends StatelessWidget {
  final Widget body;
  final bool resizeToAvoidBottomInset;
  final bool showBackground;
  final Widget? bottomNavigationBar;

  const CustomScaffold({
    super.key,
    required this.body,
    this.resizeToAvoidBottomInset = true,
    this.showBackground = true,
    this.bottomNavigationBar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: showBackground ? _backgroundDecoration : null,
        child: Stack(
          children: [
            // Main Screen Content
            Positioned.fill(
              child: body,
            ),

            if (bottomNavigationBar != null)
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: bottomNavigationBar!,
              ),
          ],
        ),
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