import '../../config/barrel.dart';

class Universe extends StatefulWidget {
  const Universe({super.key});

  @override
  State<Universe> createState() => _UniverseState();
}

class _UniverseState extends State<Universe> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      WelcomeUniverseDialog.maybeShow(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const MainAppBar(),

          SizedBox(height: 3.h),

          const NewEntityRow(),

          SizedBox(height: 3.h),

          const UniverseOrbitSection(),
          SizedBox(height: 4.h,),
        ],
      ),
    );
  }
}