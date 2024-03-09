// ignore_for_file: prefer_interpolation_to_compose_strings

import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rtkita/app/components/dialog.dart';
import 'package:rtkita/app/model/kontak.dart';
import 'package:rtkita/app/modules/home/controllers/home_controller.dart';
import 'package:rtkita/app/modules/kontak/controllers/kontak_controller.dart';
import 'package:rtkita/env/global_var.dart';

class KontakProvider extends GetConnect {
  GetStorage box = GetStorage();
  void getListKontak() async {
    List<Kontak> kontak = [];
    HomeController homeController = Get.put(HomeController());
    KontakController kontakController = Get.put(KontakController());

    try {
      homeController.loadingStatus(true);
      final response = await get('$urlApi/important-numbers',
          headers: {'Authorization': 'Bearer ' + box.read('token')});
      var data = json.decode(response.bodyString.toString());
      homeController.loadingStatus(false);
      print("data kontak : $data");
      if (data != null) {
        data["data"]["important_number"]
            .forEach((v) => kontak.add(Kontak.fromJson(v)));
        kontakController.setKontak(kontak);
      }
    } catch (e) {
      errorMessage("Terjadi kesalahan dalam memuat nomor penting");
    }
  }
}
