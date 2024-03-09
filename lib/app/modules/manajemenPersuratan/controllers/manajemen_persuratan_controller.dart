import 'package:get/get.dart';
import 'package:rtkita/app/model/cover_letter.dart';
import 'package:rtkita/app/providers/persuratan.dart';

class ManajemenPersuratanController extends GetxController {
  //TODO: Implement ManajemenPersuratanController

  List<CoverLetter?>? manajemenPersuratan;

  setManajemenPersuratan(data) {
    manajemenPersuratan = data;
    update();
  }

  @override
  void onInit() {
    super.onInit();
  }
}
