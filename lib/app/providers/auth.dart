import 'dart:convert';

// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rtkita/app/components/dialog.dart';
import 'package:rtkita/app/model/family_member.dart';
import 'package:rtkita/app/modules/home/controllers/home_controller.dart';
import 'package:rtkita/app/modules/login/controllers/login_controller.dart';
import 'package:rtkita/app/modules/login/views/login_view.dart';
import 'package:rtkita/app/modules/register/controllers/register_controller.dart';
import 'package:rtkita/app/modules/tab_decider/controllers/tab_decider_controller.dart';
import 'package:rtkita/app/modules/tab_decider/views/tab_decider_view.dart';
import 'package:rtkita/app/modules/verif_otp/views/verif_otp_view.dart';
import 'package:rtkita/env/global_var.dart';
import 'package:rtkita/notification_service.dart';

class AuthProvider extends GetConnect {
  GetStorage box = GetStorage();
  void register(context) async {
    RegisterController registerController = Get.put(RegisterController());
    HomeController homeController = Get.put(HomeController());

    final response = await post('$urlApi/register', {
      'family_member_id': registerController.selectedFamilyMember?.id!,
      'phone_number': registerController.telepon.text,
      'password': registerController.password.text,
    });
    print(
        "family member id: ${registerController.selectedFamilyMember?.id!}, phone number : ${registerController.telepon.text}, password : ${registerController.password.text}");
    var data = json.decode(response.bodyString.toString());
    print("data : $data");
    NotificationService notificationService = NotificationService();
    await notificationService.initializePlatformNotifications();
    await notificationService.showLocalNotification(
        id: 0,
        title: "Kode OTP",
        body: "Masukkan kode otp : " + data['otp_code']['code'].toString(),
        payload: "You just took water! Huurray!");

    homeController.loadingStatus(false);
    if (data['status'] != 'error') {
      box.write('token', data['token']);
      box.write('user', data['family_member']);
      Get.to(() => VerifOtpView(data['otp_code']['code']));
    } else {
      errorMessage(data['message']);
    }
  }

  Future<bool?> login({String? phoneNumber, String? password}) async {
    // await Firebase.initializeApp();
    LoginController loginController = Get.put(LoginController());
    HomeController homeController = Get.put(HomeController());
    if (loginController.telepon.text != '' &&
        loginController.password.text != '') {
      try {
        String? fcmToken = await FirebaseMessaging.instance.getToken();
        homeController.loadingStatus(true);
        final response = await post('$urlApi/login-warga', {
          'phone_number': phoneNumber ?? loginController.telepon.text,
          'password': password ?? loginController.password.text,
          'fcm_token': fcmToken,
        });
        var data = json.decode(response.bodyString.toString());
        homeController.loadingStatus(false);
        print("data login : $data");
        if (data['status'] != 'ERR') {
          box.write('token', data['token']);
          box.write('user', data['data']['user']['family_member']);
          if (data['data']['role'] != "warga") {
            box.write('role', data['data']['role']['role_name']);
          } else {
            box.write('role', data['data']['role']);
          }
          loginController.selectFamilyMember(
              FamilyMember.fromJson(data['data']['user']['family_member']));
          Get.offAll(() => TabDeciderView());
          return true;
        } else {
          errorMessage(data['message']);
        }
        homeController.loadingStatus(false);
        return false;
      } catch (e) {
        errorMessage("Terjadi kesalahan pada login");
      }
      return false;
    }
    return false;
  }

  Future<bool?> getDataDiri(token) async {
    HomeController homeController = Get.put(HomeController());
    TabDeciderController tabDeciderController =
        Get.find<TabDeciderController>();

    try {
      homeController.loadingStatus(true);
      final response = await get('$urlApi/profile',
          headers: {'Authorization': 'Bearer ' + token});
      var data = json.decode(response.bodyString.toString());
      print(data);
      homeController.loadingStatus(false);
      if (data['status'] != 'ERR') {
        box.write('user', data['data']['user']['family_member']);
        tabDeciderController.getUser();
        return true;
      } else {
        errorMessage(data['message']);
      }
      homeController.loadingStatus(false);
      return false;
    } catch (e) {
      errorMessage("Terjadi kesalahan");
    }
    return false;
  }

  void editProfile(avatar) async {
    HomeController homeController = Get.put(HomeController());
    String token = box.read('token');

    try {
      homeController.loadingStatus(true);
      final form = FormData({
        'avatar': MultipartFile(avatar.path.toString(),
            filename: 'file${avatar.path.split('/').last}'),
      });
      final response = await post('$urlApi/update-profile', form,
          headers: {'Authorization': 'Bearer ' + box.read('token')});
      var data = json.decode(response.bodyString.toString());
      homeController.loadingStatus(false);
      if (data['status'] != 'ERR') {
        getDataDiri(token);
      } else {
        errorMessage(data['message']);
      }
    } catch (e) {
      homeController.loadingStatus(false);
      errorMessage("Terjadi kesalahan");
    }
  }

  logout(context) {
    box.remove('token');
    Get.offAll(() => LoginView());
  }
}