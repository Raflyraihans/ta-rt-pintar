import 'package:get/get.dart';

import '../controllers/tab_decider_controller.dart';

class TabDeciderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TabDeciderController>(
      () => TabDeciderController(),
    );
  }
}
