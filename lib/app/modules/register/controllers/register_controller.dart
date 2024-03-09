import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rtkita/app/model/family_member.dart';

class RegisterController extends GetxController {
  TextEditingController namaLengkap = TextEditingController();
  TextEditingController nik = TextEditingController();
  TextEditingController ttl = TextEditingController();
  TextEditingController pekerjaan = TextEditingController();
  TextEditingController telepon = TextEditingController();
  TextEditingController password = TextEditingController();
  String gender = '';

  List<FamilyMember?> familyMember = [];
  FamilyMember? selectedFamilyMember;

  setFamilyMember(List<FamilyMember?> data) {
    familyMember = data;
    update();
  }

  selectFamilyMember(FamilyMember? data) {
    selectedFamilyMember = data;
    namaLengkap.text = data!.familyMemberName!;
    nik.text = data.nik!;
    ttl.text = '${data.birthPlace!}, ${data.birthDate!}';
    pekerjaan.text = data.job!;
    gender = data.gender!;
    update();
  }

  @override
  void onClose() {
    namaLengkap.clear();
    nik.clear();
    ttl.clear();
    pekerjaan.clear();
    telepon.clear();
    password.clear();
    gender = '';
    super.onClose();
  }
}
