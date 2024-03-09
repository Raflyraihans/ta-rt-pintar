import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rtkita/app/modules/login/views/login_view.dart';
import 'package:rtkita/app/modules/tab_decider/views/tab_decider_view.dart';

class SplashScreenController extends GetxController {
  void pageDecider() {
    GetStorage box = GetStorage();
    Future.delayed(const Duration(seconds: 3), () {
      if (box.read('token') == null || box.read('user') == null) {
        Get.off(() => LoginView());
      } else {
        Get.off(() => TabDeciderView());
      }
    });
  }

  @override
  void onInit() {
    pageDecider();
    super.onInit();
  }
}
