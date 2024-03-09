import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import 'firebase_options.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  RemoteNotification? notification = message.notification;
  if (message.data['type'] == 'PANIC_BUTTON') {
    final assetsAudioPlayer = AssetsAudioPlayer();
    assetsAudioPlayer.open(
      Audio("assets/rush.mp3"),
      showNotification: false,
    );
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  runApp(
    GetMaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: false
      ),
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
    ),
  );
}
