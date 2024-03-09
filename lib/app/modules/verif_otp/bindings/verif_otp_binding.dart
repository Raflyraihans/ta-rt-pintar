import 'package:get/get.dart';

import '../controllers/verif_otp_controller.dart';

class VerifOtpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VerifOtpController>(
      () => VerifOtpController(),
    );
  }
}
