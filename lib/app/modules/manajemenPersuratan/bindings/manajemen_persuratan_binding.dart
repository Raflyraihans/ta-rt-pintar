import 'package:get/get.dart';

import '../controllers/manajemen_persuratan_controller.dart';

class ManajemenPersuratanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ManajemenPersuratanController>(
      () => ManajemenPersuratanController(),
    );
  }
}
