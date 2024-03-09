import 'package:get/get.dart';

import '../controllers/manajemen_iuran_controller.dart';

class ManajemenIuranBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ManajemenIuranController>(
      () => ManajemenIuranController(),
    );
  }
}
