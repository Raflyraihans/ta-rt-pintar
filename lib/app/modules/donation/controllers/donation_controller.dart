import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rtkita/app/model/donation.dart';

class DonationController extends GetxController {
  List<Donation> donation = [];
  TextEditingController jumlah = TextEditingController();
  XFile? dataImage;

  setDonation(data) {
    donation = data;
    update();
  }

  setImage(data) {
    dataImage = data;
    update();
  }
}
