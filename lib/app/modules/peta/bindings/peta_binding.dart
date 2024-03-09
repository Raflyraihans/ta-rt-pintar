import 'package:get/get.dart';

import '../controllers/peta_controller.dart';

class PetaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PetaController>(
      () => PetaController(),
    );
  }
}
