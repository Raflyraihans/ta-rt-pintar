import 'package:get/get.dart';

import '../controllers/iuran_controller.dart';

class IuranBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IuranController>(
      () => IuranController(),
    );
  }
}
