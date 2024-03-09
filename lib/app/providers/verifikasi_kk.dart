import 'dart:convert';

import 'package:get/get.dart';
import 'package:rtkita/app/components/dialog.dart';
import 'package:rtkita/app/model/family_card.dart';
import 'package:rtkita/app/model/family_member.dart';
import 'package:rtkita/app/modules/home/controllers/home_controller.dart';
import 'package:rtkita/app/modules/register/controllers/register_controller.dart';
import 'package:rtkita/app/modules/verif_kk/controllers/verif_kk_controller.dart';
import 'package:rtkita/env/global_var.dart';

class VerifKKProvider extends GetConnect {
  void checkKK(context) async {
    List<FamilyMember?> familyMember = [];
    FamilyCard? familyCard;

    VerifKkController verifKKController = Get.put(VerifKkController());
    RegisterController registerController = Get.put(RegisterController());
    HomeController homeController = Get.put(HomeController());

    try {
      homeController.loadingStatus(true);
      final response = await post('$urlApi/check-family-card', {
        'family_card_number': verifKKController.nomorKK.text,
      });
      var data = json.decode(response.bodyString.toString())["data"];

      homeController.loadingStatus(false);
      if (data != null) {
        familyCard = FamilyCard.fromJson(data['family_card']);
        data['family_member']
            .forEach((v) => familyMember.add(FamilyMember.fromJson(v)));
        verifKKController.setFamilyCard(familyCard);
        registerController.setFamilyMember(familyMember);
        accountChecker(context);
      }
    } catch (e) {
      homeController.loadingStatus(false);
      errorMessage("Terjadi kesalahan dalam memverifikasi KK anda");
    }
  }
}
