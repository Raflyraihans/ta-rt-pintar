import 'package:get/get.dart';

import '../controllers/lupa_telepon_controller.dart';

class LupaTeleponBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LupaTeleponController>(
      () => LupaTeleponController(),
    );
  }
}
