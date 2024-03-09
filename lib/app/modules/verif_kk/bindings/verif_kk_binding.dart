import 'package:get/get.dart';

import '../controllers/verif_kk_controller.dart';

class VerifKkBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VerifKkController>(
      () => VerifKkController(),
    );
  }
}
