import 'package:get/get.dart';

import '../controllers/persuratan_controller.dart';

class PersuratanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PersuratanController>(
      () => PersuratanController(),
    );
  }
}
