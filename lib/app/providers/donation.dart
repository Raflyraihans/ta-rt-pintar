import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rtkita/app/components/dialog.dart';
import 'package:rtkita/app/model/donation.dart';
import 'package:rtkita/app/model/payment.dart';
import 'package:rtkita/app/modules/Manajemen_Iuran/controllers/manajemen_iuran_controller.dart';
import 'package:rtkita/app/modules/Manajemen_Iuran/views/manajemen_iuran_view.dart';
import 'package:rtkita/app/modules/donation/controllers/donation_controller.dart';
import 'package:rtkita/app/modules/home/controllers/home_controller.dart';
import 'package:rtkita/app/modules/home/views/home_view.dart';
import 'package:rtkita/app/modules/tab_decider/views/tab_decider_view.dart';
import 'package:rtkita/env/global_var.dart';

class DonationProvider extends GetConnect {
  GetStorage box = GetStorage();

  void getListDonation() async {
    List<Donation> donations = [];
    HomeController homeController = Get.put(HomeController());

    try {
      homeController.loadingStatus(true);
      final response = await get('$urlApi/iuran',
          // ignore: prefer_interpolation_to_compose_strings
          headers: {'Authorization': 'Bearer ' + box.read('token')});
      var data = json.decode(response.bodyString.toString());
      print("data iuran : $data");
      if (data != null) {
        data['data']['iuran']
            .forEach((v) => donations.add(Donation.fromJson(v)));
        DonationController donationController = Get.put(DonationController());
        donationController.setDonation(donations);
      }
      homeController.loadingStatus(false);
    } catch (e) {
      errorMessage("Terjadi kesalahan dalam memuat donasi");
    }
  }

  void getListReceiveDonation() async {
    List<Payment> payments = [];
    HomeController homeController = Get.put(HomeController());

    try {
      homeController.loadingStatus(true);
      final response = await get('$urlApi/iuran-bills',
          // ignore: prefer_interpolation_to_compose_strings
          headers: {'Authorization': 'Bearer ' + box.read('token')});
      var data = json.decode(response.bodyString.toString());
      print("data pembayaran iuran : $data");
      if (data != null) {
        data['data']['iuran_bills']
            .forEach((v) => payments.add(Payment.fromJson(v)));
        ManajemenIuranController manajemenIuranC =
            Get.put(ManajemenIuranController());
        manajemenIuranC.setDataPembayaran(payments);
      }
      homeController.loadingStatus(false);
    } catch (e) {
      errorMessage("Terjadi kesalahan dalam memuat donasi");
    }
  }

  void sendDonation(id) async {
    DonationController donationController = Get.put(DonationController());
    HomeController homeController = Get.put(HomeController());

    try {
      homeController.loadingStatus(true);

      final form = FormData({
        'donation_id': id,
        'nominal': donationController.jumlah.text,
        'file': MultipartFile(donationController.dataImage!.path.toString(),
            filename:
                'file${donationController.dataImage!.path.split('/').last}'),
      });
      final response = await post('$urlApi/iuran/${id}/bill', form,
          headers: {'Authorization': 'Bearer ' + box.read('token')});
      var data = json.decode(response.bodyString.toString());

      if (data['status'] != 'ERR') {
        successMessage(Get.context, data['message']);
        Get.off(TabDeciderView());
      } else {
        errorMessage(data['message']);
      }
      homeController.loadingStatus(false);
    } catch (e) {
      errorMessage("Terjadi kesalahan ketika mengirim donasi");
    }
  }
}
