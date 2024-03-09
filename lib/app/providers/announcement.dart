// ignore_for_file: prefer_interpolation_to_compose_strings

import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rtkita/app/components/dialog.dart';
import 'package:rtkita/app/model/announcement.dart';
import 'package:rtkita/app/modules/home/controllers/home_controller.dart';
import 'package:rtkita/app/modules/manajemenPengumuman/controllers/manajemen_pengumuman_controller.dart';
import 'package:rtkita/env/global_var.dart';

class AnnouncementProvider extends GetConnect {
  GetStorage box = GetStorage();
  Future getListAnnouncement() async {
    List<Announcement> announcement = [];
    print("announcement : $announcement");

    try {
      final response = await get('$urlApi/notices',
          headers: {'Authorization': 'Bearer ' + box.read('token')});
      var data = json.decode(response.bodyString.toString());
      print("data announcement : $data");

      if (data != null) {
        print("data notice : ${data["data"]['notice']}");
        if (data["data"]['notice'] != null) {
          data["data"]['notice']
              .forEach((v) => announcement.add(Announcement.fromJson(v)));
          HomeController homeController = Get.put(HomeController());
          homeController.setAnnouncementData(announcement);
        }
      }
    } catch (e) {
      errorMessage("Terjadi kesalahan dalam memuat pengumuman");
    }
  }

  void sendPengumuman(context) async {
    ManajemenPengumumanController pengumumanController =
        Get.put(ManajemenPengumumanController());
    HomeController homeController = Get.put(HomeController());

    try {
      homeController.loadingStatus(true);
      final response = await post('$urlApi/notices', {
        'title': pengumumanController.title.text,
        'description': pengumumanController.description.text,
      }, headers: {
        'Authorization': 'Bearer ' + box.read('token')
      });
      var data = json.decode(response.bodyString.toString());
      if (data['status'] != 'ERR') {
        Get.back();
        AnnouncementProvider announcementProvider = AnnouncementProvider();
        announcementProvider.getListAnnouncement();
        homeController.loadingStatus(false);
        successMessage(context, data['message']);
      } else {
        errorMessage(data['message']);
      }
    } catch (e) {
      homeController.loadingStatus(false);
      errorMessage("Terjadi kesalahan dalam mengirim pengumuman");
    }
  }
}
