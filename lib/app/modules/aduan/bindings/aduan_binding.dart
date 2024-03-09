import 'package:get/get.dart';

import '../controllers/aduan_controller.dart';

class AduanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AduanController>(
      () => AduanController(),
    );
  }
}
