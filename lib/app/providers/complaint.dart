// ignore_for_file: prefer_interpolation_to_compose_strings

import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rtkita/app/components/dialog.dart';
import 'package:rtkita/app/model/announcement.dart';
import 'package:rtkita/app/model/complaint.dart';
import 'package:rtkita/app/modules/aduan/controllers/aduan_controller.dart';
import 'package:rtkita/app/modules/home/controllers/home_controller.dart';
import 'package:rtkita/app/modules/manajemenAduanWarga/controllers/manajemen_aduan_warga_controller.dart';
import 'package:rtkita/app/providers/announcement.dart';
import 'package:rtkita/env/global_var.dart';

class AduanProvider extends GetConnect {
  GetStorage box = GetStorage();
  void getListComplaint() async {
    List<Complaint> complaint = [];
    HomeController homeController = Get.put(HomeController());
    try {
      homeController.loadingStatus(true);
      final response = await get('$urlApi/complaint',
          headers: {'Authorization': 'Bearer ' + box.read('token')});
      var data = json.decode(response.bodyString.toString())['data'];
      if (data != null) {
        if (data['complaint'] != null) {
          data['complaint']
              .forEach((v) => complaint.add(Complaint.fromJson(v)));
        }
        AduanController aduanController = Get.put(AduanController());
        aduanController.setDataAduan(complaint);
      }
      homeController.loadingStatus(false);
    } catch (e) {
      errorMessage("Terjadi kesalahan dalam memuat aduan");
    }
  }

  void getListComplaintPengurus() async {
    List<Complaint> complaint = [];
    HomeController homeController = Get.put(HomeController());
    try {
      homeController.loadingStatus(true);
      final response = await get('$urlApi/pengurus-complaint',
          headers: {'Authorization': 'Bearer ' + box.read('token')});
      var data = json.decode(response.bodyString.toString());
      if (data != null) {
        data['complaint'].forEach((v) => complaint.add(Complaint.fromJson(v)));
        ManajemenAduanWargaController aduanController =
            Get.put(ManajemenAduanWargaController());
        aduanController.setDataAduanWarga(complaint);
      }
      homeController.loadingStatus(false);
    } catch (e) {
      errorMessage("Terjadi kesalahan dalam memuat aduan");
    }
  }

  void updateStatusComplaint(id, status) async {
    HomeController homeController = Get.put(HomeController());
    try {
      homeController.loadingStatus(true);
      await post('$urlApi/pengurus-complaint/$id', {
        'status': status,
      }, headers: {
        'Authorization': 'Bearer ' + box.read('token')
      });
      homeController.loadingStatus(false);
      getListComplaintPengurus();
    } catch (e) {
      errorMessage("Terjadi kesalahan dalam memuat aduan");
    }
  }

  Future<List<Complaint?>> getHistoryComplaint(context) async {
    List<Complaint?> complaint = [];

    try {
      final response = await get('$urlApi/history-aduan-warga',
          headers: {'Authorization': 'Bearer ' + box.read('token')});
      var data = json.decode(response.bodyString.toString());
      if (data != null) {
        data['complaint'].forEach((v) => complaint.add(Complaint.fromJson(v)));
      }
    } catch (e) {
      errorMessage("Terjadi kesalahan dalam memuat aduan");
    }
    return complaint;
  }

  void sendRequestAduan(context) async {
    AduanController aduanController = Get.put(AduanController());
    HomeController homeController = Get.put(HomeController());
    // try {
      homeController.loadingStatus(true);
      final response = await post('$urlApi/complaint', {
        'title': aduanController.title.text,
        'description': aduanController.description.text,
      }, headers: {
        'Authorization': 'Bearer ' + box.read('token')
        });
      var data = json.decode(response.bodyString.toString())['data'];
      print(data);
      if (data['status'] != 'ERR') {
        if (aduanController.photo != null) {
          final form = FormData({
            'complaint_id': data['complaint']['id'].toString(),
            'document': MultipartFile(aduanController.photo!.path.toString(),
                filename: 'file${aduanController.photo!.path.split('/').last}'),
          });
          await post('$urlApi/complaint-document', form,
              headers: {'Authorization': 'Bearer ' + box.read('token')});
          getListComplaint();
        }
        Get.back();
        homeController.loadingStatus(false);
        successMessage(context, 'Berhasil mengirim data');
      } else {
        errorMessage(data['message']);
      }
    // } catch (e) {
    //   homeController.loadingStatus(false);
    //   errorMessage(e);
    // }
  }

  void sendRequestPengumuman(context) async {
    AduanController aduanController = Get.put(AduanController());
    HomeController homeController = Get.put(HomeController());

    try {
      homeController.loadingStatus(true);
      final response = await post('$urlApi/pengurus-pengumuman/store', {
        'title': aduanController.title.text,
        'description': aduanController.description.text,
        'status': 'aktif',
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
      errorMessage(e);
    }
  }
}
