// ignore_for_file: prefer_interpolation_to_compose_strings

import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rtkita/app/components/dialog.dart';
import 'package:rtkita/app/model/cover_letter.dart';
import 'package:rtkita/app/model/family_member.dart';
import 'package:rtkita/app/modules/home/controllers/home_controller.dart';
import 'package:rtkita/app/modules/manajemenPersuratan/controllers/manajemen_persuratan_controller.dart';
import 'package:rtkita/app/modules/persuratan/controllers/persuratan_controller.dart';
import 'package:rtkita/env/global_var.dart';

class PersuratanProvider extends GetConnect {
  GetStorage box = GetStorage();

  Future<List<CoverLetter?>> getListSurat(context) async {
    // ignore: unused_local_variable
    PersuratanController persuratanController = Get.put(PersuratanController());
    HomeController homeController = Get.put(HomeController());
    List<CoverLetter?> coverLetter = [];
    try {
      homeController.loadingStatus(true);
      final response = await get('$urlApi/cover-letter',
          headers: {'Authorization': 'Bearer ' + box.read('token')});
      var data = json.decode(response.bodyString.toString())['data'];
      homeController.loadingStatus(false);
      if (data != null) {
        if (data['status'] != 'ERR') {
          if (data['cover_letter'] != null) {
            data['cover_letter']
                .forEach((v) => coverLetter.add(CoverLetter.fromJson(v)));
          }
        } else {
          errorMessage(data['message']);
        }
      }
    } catch (e) {
      errorMessage("Terjadi kesalahan dalam memuat persuratan");
    }
    return coverLetter;
  }

  void getPengurusListSurat() async {
    // ignore: unused_local_variable
    HomeController homeController = Get.put(HomeController());
    List<CoverLetter?> coverLetter = [];

    // try {
      ManajemenPersuratanController persuratanController =
          Get.put(ManajemenPersuratanController());
      homeController.loadingStatus(true);
      final response = await get('$urlApi/pengurus-cover-letter',
          headers: {'Authorization': 'Bearer ' + box.read('token')});
      var data = json.decode(response.bodyString.toString())['data'];
      print(data);
      homeController.loadingStatus(false);
      if (data != null) {
        if (data['status'] != 'ERR') {
          if (data['cover_letter'] != null) {
            data['cover_letter']
                .forEach((v) => coverLetter.add(CoverLetter.fromJson(v)));
          }
        } else {
          errorMessage(data['message']);
        }
        persuratanController.setManajemenPersuratan(coverLetter);
      }
    // } catch (e) {
    //   errorMessage(e);
    // }
  }

  void updateStatusSurat(id, status) async {
    HomeController homeController = Get.put(HomeController());
    // try {
      homeController.loadingStatus(true);
      final response = await post('$urlApi/pengurus-cover-letter-$id', {
        'status': status,
      }, headers: {
        'Authorization': 'Bearer ' + box.read('token')
      });
      // var data = json.decode(response.bodyString.toString());
      print(response.bodyString);
      homeController.loadingStatus(false);
      getPengurusListSurat();
    // } catch (e) {
    //   errorMessage(e);
    // }
  }

  void getFamilyData(context) async {
    PersuratanController persuratanController = Get.put(PersuratanController());
    HomeController homeController = Get.put(HomeController());
    List<FamilyMember?> familyMember = [];

    try {
      homeController.loadingStatus(true);
      final response = await get('$urlApi/data-family',
          headers: {'Authorization': 'Bearer ' + box.read('token')});
      var data = json.decode(response.bodyString.toString())['data'];
      homeController.loadingStatus(false);
      if (data['status'] != 'ERR') {
        data['family_member']
            .forEach((v) => familyMember.add(FamilyMember.fromJson(v)));
        persuratanController.setFamilyMember(familyMember);
      } else {
        errorMessage(data['message']);
      }
    } catch (e) {
      errorMessage("Terjadi kesalahan dalam memuat data keluarga");
      homeController.loadingStatus(false);
    }
  }

  void sendRequestSurat(context, title, familyMemberId) async {
    PersuratanController persuratanController = Get.put(PersuratanController());
    HomeController homeController = Get.put(HomeController());

    try {
      homeController.loadingStatus(true);
      final response = await post('$urlApi/cover-letter', {
        'title': title.toString(),
        'description': persuratanController.deskripsiSurat.text,
        'family_member_id': familyMemberId.toString(),
      }, headers: {
        'Authorization': 'Bearer ' + box.read('token')
      });
      var data = json.decode(response.bodyString!);
      homeController.loadingStatus(false);
      if (data['status'] != 'ERR') {
        Get.back();
        successMessage(context, data['message']);
      } else {
        errorMessage(data['message']);
      }
      homeController.loadingStatus(false);
    } catch (e) {
      homeController.loadingStatus(false);
      errorMessage("Terjadi kesalahan ketika mengirim persuratan");
    }
  }
}
