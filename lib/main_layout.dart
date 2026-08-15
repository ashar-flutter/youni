import '../config/barrel.dart';

class MainLayout extends StatefulWidget {
  final int initialIndex;

  const MainLayout({super.key, this.initialIndex = 0});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  late int _currentIndex;

  final List<Widget> _screens = const [
    Universe(),
    TabHost(
      tabKey: 'todo',
      screens: [ToDoList(), ToDoCards()],
    ),
    Drafts(),
    Archive(),
    TreeView(),
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;

    if (!Get.isRegistered<UiController>()) {
      Get.put(UiController());
    }
  }

  @override
  void dispose() {
    Get.delete<UiController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _currentIndex,
        onItemTapped: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
    );
  }
}

class TabHost extends StatelessWidget {
  final String tabKey;
  final List<Widget> screens;

  const TabHost({
    super.key,
    required this.tabKey,
    required this.screens,
  });

  @override
  Widget build(BuildContext context) {
    final UiController ui = Get.find<UiController>();

    return Obx(() {
      final int index = ui.getIndex(tabKey);
      return IndexedStack(index: index, children: screens);
    });
  }
}