// ignore_for_file: must_be_immutable

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rtkita/app/components/dialog.dart';
import 'package:rtkita/app/modules/epolling/views/epolling_view.dart';
import 'package:rtkita/app/modules/home/views/home_view.dart';
import 'package:rtkita/app/modules/peta/views/peta_view.dart';
import 'package:rtkita/app/modules/profile/views/profile_view.dart';
import 'package:rtkita/app/providers/panic_button.dart';
import 'package:rtkita/env/color.dart';
import 'package:rtkita/widgets/button.dart';
import 'package:rtkita/widgets/dialog.dart';
import 'package:rtkita/widgets/navigation.dart';
import 'package:rtkita/widgets/text.dart';

import '../controllers/tab_decider_controller.dart';

class TabDeciderView extends GetView<TabDeciderController> {
  TabDeciderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        top: false,
        child: GetBuilder<TabDeciderController>(
          init: TabDeciderController(),
          initState: ((state) {
            FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
              RemoteNotification? notification = message.notification;

              if (notification != null) {
                if (notification.title!.contains('Bahaya:')) {
                  final assetsAudioPlayer = AssetsAudioPlayer();

                  assetsAudioPlayer.open(
                    Audio("assets/rush.mp3"),
                  );
                  Get.dialog(SimpleBoxDialog(
                    title: 'Keadaan Darurat',
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CText(notification.title!, fontWeight: FontWeight.w700,),
                        const SizedBox(height: 8,),
                        CText(notification.body!),
                        Container(
                          transform: Matrix4.translationValues(0, 30, 0),
                          child: Row(
                            children: [
                              Expanded(
                                child: PrimaryButton(
                                  text: 'Konfirmasi',
                                  onTap: () {
                                    Get.back();
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ));
                }
              }
            });
          }),
          builder: (c) => Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    child: IndexedStack(
                      index: c.currentPage,
                      children: [
                        HomeView(),
                        const ProfileView(),
                      ],
                    ),
                  ),
                  Container(
                    height:
                        MediaQuery.of(context).viewInsets.bottom > 200 ? 0 : 75,
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 4),
                    decoration: BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.10),
                          offset: const Offset(0, -6),
                          blurRadius: 8.0),
                    ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Center(
                            child: InkWell(
                              onTap: () {
                                c.changePage(0);
                              },
                              child: ItemNavbar(
                                  c.currentPage == 0 ? true : false,
                                  icon: FluentIcons.home_24_regular,
                                  itemName: 'Beranda'),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 100,
                        ),
                        Expanded(
                          child: Center(
                            child: InkWell(
                              onTap: () {
                                c.changePage(1);
                              },
                              child: ItemNavbar(
                                  c.currentPage == 1 ? true : false,
                                  icon: FluentIcons.person_24_regular,
                                  itemName: 'Profile'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Positioned(
                bottom: 20,
                left: 0,
                right: 0,
                child: Center(
                  child: Container(
                    height: 85,
                    width: 85,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.10),
                            offset: const Offset(0, -12),
                            blurRadius: 8.0),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 30,
                left: 0,
                right: 0,
                child: Center(
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      customBorder: const CircleBorder(),
                      onTap: () {
                        GetStorage box = GetStorage();
                        print(box.read('fcm_token'));
                        final PanicProvider panic = PanicProvider();

                        confirmMessage(context, 'Panic Button!',
                            'Panggilan akan diteruskan ke seluruh pengurus.',
                            () {
                          Get.back();
                          panic.sendPanic(context);
                        });
                      },
                      child: Container(
                        height: 65,
                        width: 65,
                        decoration: BoxDecoration(
                          color: dangerRed,
                          shape: BoxShape.circle,
                        ),
                        child: const Center(
                          child: Icon(
                            FluentIcons.alert_urgent_24_filled,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
