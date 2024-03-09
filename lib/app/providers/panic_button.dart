// ignore_for_file: prefer_interpolation_to_compose_strings

import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rtkita/app/components/dialog.dart';
import 'package:rtkita/app/model/panic_button.dart';
import 'package:rtkita/app/modules/peta/controllers/peta_controller.dart';
import 'package:rtkita/env/global_var.dart';

class PanicProvider extends GetConnect {
  GetStorage box = GetStorage();
  void sendPanic(context) async {
    try {
      final response = await get('$urlApi/panic-button',
          headers: {'Authorization': 'Bearer ' + box.read('token')});
      print(response.bodyString);
      var data = json.decode(response.bodyString.toString());
      if (data != null) {
        successMessage(context, 'Pengurus akan segera menghubungi anda!');
      }
    } catch (e) {
      errorMessage("Terjadi kesalahan ketika mengirim panic button");
    }
  }

  void getListPanic(context) async {
    PetaController peta = Get.put(PetaController());

    List<PanicButton?> panicButton = [];
    try {
      final response = await get('$urlApi/panic-button',
          headers: {'Authorization': 'Bearer ' + box.read('token')});
      var data = json.decode(response.bodyString.toString());

      if (data != null) {
        if (data['panic_button'].isNotEmpty) {
          data['panic_button']
              .forEach((v) => panicButton.add(PanicButton.fromJson(v)));

          peta.updateMarker(panicButton);
        }
      }
    } catch (e) {
      errorMessage("Terjadi kesalahan dalam memuat data panic button");
    }
  }
}
