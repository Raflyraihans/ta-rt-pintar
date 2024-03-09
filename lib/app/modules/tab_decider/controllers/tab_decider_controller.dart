import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rtkita/app/model/family_member.dart';

class TabDeciderController extends GetxController {
  GetStorage box = GetStorage();
  FamilyMember? user;
  int currentPage = 0;

  void getUser() {
    user = FamilyMember.fromJson(box.read('user'));
    update();
  }

  void changePage(index) {
    currentPage = index;

    print("currentPage : $currentPage");
    update();
  }

  @override
  void onInit() {
    getUser();
    super.onInit();
  }
}
