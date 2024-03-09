import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rtkita/app/model/family_member.dart';

class LoginController extends GetxController {
  TextEditingController telepon = TextEditingController();
  TextEditingController password = TextEditingController();
  FamilyMember? selectedFamilyMember;
  bool obscureText = true;
  bool terms = false;

  setObscure(bool status) {
    obscureText = status;
    update();
  }

  setTerms(bool status) {
    terms = status;
    update();
  }

  selectFamilyMember(FamilyMember? data) {
    selectedFamilyMember = data;
    update();
  }
}
