import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rtkita/app/model/family_card.dart';

class VerifKkController extends GetxController {
  TextEditingController nomorKK = TextEditingController();
  FamilyCard? familyCard;

  setFamilyCard(FamilyCard data) {
    familyCard = data;
    update();
  }
}
