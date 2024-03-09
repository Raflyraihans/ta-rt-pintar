import 'package:get/get.dart';
import 'package:rtkita/app/model/complaint.dart';
import 'package:rtkita/app/providers/complaint.dart';

class ManajemenPollingController extends GetxController {
  List<Complaint> aduanWarga = [];

  setDataPolling(List<Complaint> data) {
    aduanWarga = data;
    update();
  }

  @override
  void onInit() {
    final AduanProvider aduanProvider = AduanProvider();
    aduanProvider.getListComplaintPengurus();
    super.onInit();
  }
}
