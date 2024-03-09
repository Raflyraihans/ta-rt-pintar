import 'package:get/get.dart';

import '../controllers/manajemen_aduan_warga_controller.dart';

class ManajemenAduanWargaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ManajemenAduanWargaController>(
      () => ManajemenAduanWargaController(),
    );
  }
}
