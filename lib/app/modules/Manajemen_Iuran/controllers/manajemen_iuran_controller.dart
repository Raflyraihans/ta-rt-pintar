import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rtkita/app/model/payment.dart';
import 'package:rtkita/app/providers/donation.dart';

class ManajemenIuranController extends GetxController {
  //TODO: Implement ManajemenIuranController
  List<Payment> payments = [];

  setDataPembayaran(List<Payment> data) {
    payments = data;
    update();
  }

  convertDate(date) {
    var dateFormat = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(date);
    var inputDate = DateTime.parse(dateFormat.toString());
    var outputFormat = DateFormat('MM/dd/yyyy hh:mm a');
    var outputDate = outputFormat.format(inputDate);
    return outputDate;
  }

  @override
  void onInit() {
    final DonationProvider donationProvider = DonationProvider();
    donationProvider.getListReceiveDonation();
    super.onInit();
  }
}
