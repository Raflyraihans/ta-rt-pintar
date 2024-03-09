import 'package:get/get.dart';

import '../controllers/manajemen_polling_controller.dart';

class ManajemenPollingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ManajemenPollingController>(
      () => ManajemenPollingController(),
    );
  }
}
