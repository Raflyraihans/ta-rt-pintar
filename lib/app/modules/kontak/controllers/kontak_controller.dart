import 'package:get/get.dart';
import 'package:rtkita/app/model/kontak.dart';

class KontakController extends GetxController {
  List<Kontak> kontak = [];

  setKontak(data) {
    kontak = data;
    update();
  }
}
