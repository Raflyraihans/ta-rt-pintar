import 'package:get/get.dart';

import '../controllers/manajemen_pengumuman_controller.dart';

class ManajemenPengumumanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ManajemenPengumumanController>(
      () => ManajemenPengumumanController(),
    );
  }
}
