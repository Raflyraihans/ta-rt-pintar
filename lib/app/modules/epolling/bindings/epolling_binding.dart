import 'package:get/get.dart';

import '../controllers/epolling_controller.dart';

class EpollingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EpollingController>(
      () => EpollingController(),
    );
  }
}
