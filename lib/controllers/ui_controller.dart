import '../config/barrel.dart';

class UiController extends GetxController {
  final RxMap<String, int> screenIndexes = <String, int>{}.obs;

  int getIndex(String key) {
    return screenIndexes[key] ?? 0;
  }

  void navigate(String key, int index) {
    if (screenIndexes[key] == index) return;

    screenIndexes[key] = index;
  }
}