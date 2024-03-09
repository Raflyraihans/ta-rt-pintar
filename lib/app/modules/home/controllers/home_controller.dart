import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rtkita/app/model/announcement.dart';

class HomeController extends GetxController {
  GetStorage box = GetStorage();
  bool loading = false;
  String? fcmToken = '';
  List<Announcement> announcement = [];

  setAnnouncementData(List<Announcement> data) {
    announcement = data;
    update();
  }

  getToken() async {
    fcmToken = await FirebaseMessaging.instance.getToken();
    box.write('fcm_token', fcmToken);
    update();
  }

  loadingStatus(bool status) async {
    await Future.delayed(Duration.zero);
    loading = status;
    update();
  }

  @override
  void onInit() {
    getToken();
    super.onInit();
  }
}
