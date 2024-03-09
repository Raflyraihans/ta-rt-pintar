import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rtkita/app/model/complaint.dart';
import 'package:rtkita/app/providers/complaint.dart';

class AduanController extends GetxController {
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  XFile? photo;

  List<Complaint>? aduan = [];
  List<Complaint> historyAduan = [];

  setDataAduan(data) {
    aduan = data;
    update();
  }

  setDataHistoryAduan(data) {
    historyAduan = data;
    update();
  }

  void setImage(XFile? data) {
    photo = data;
    update();
  }

  @override
  void onInit() async {
    final AduanProvider aduanProvider = AduanProvider();
    aduanProvider.getListComplaint();
    super.onInit();
  }
}
