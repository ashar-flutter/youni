import '../../../config/barrel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return GetMaterialApp(
          title: 'Youni',
          home: const Splash(),
          debugShowCheckedModeBanner: false,
          builder: (context, child) {
            return SafeArea(
              child: child!,
            );
          },
        );
      },
    );
  }
}