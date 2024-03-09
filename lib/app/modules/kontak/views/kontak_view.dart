import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rtkita/app/providers/kontak_darurat.dart';
import 'package:rtkita/env/color.dart';
import 'package:rtkita/widgets/body_builder.dart';
import 'package:rtkita/widgets/shimmer_loading.dart';
import 'package:rtkita/widgets/text.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controllers/kontak_controller.dart';

// ignore: must_be_immutable
class KontakView extends GetView<KontakController> {
  KontakView({Key? key}) : super(key: key);
  KontakController c = Get.put(KontakController());
  final KontakProvider kontakProvider = KontakProvider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Shimmer(
          linearGradient: shimmerGradient,
          child: SafeArea(
            child: Column(
              children: [
                Container(
                  height: 56,
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(0),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 15,
                            offset: const Offset(0, 10))
                      ]),
                  // ignore: prefer_const_literals_to_create_immutables
                  child: Row(children: [
                    Expanded(
                      child: Container(
                          transform: Matrix4.translationValues(-20, 0, 0),
                          // ignore: prefer_const_constructors
                          child: BackButton()),
                    ),
                    // ignore: prefer_const_constructors
                    Expanded(
                      flex: 2,
                      child: const Center(
                        child: Text(
                          'Nomor Penting',
                          style: TextStyle(
                            // ignore: unnecessary_const
                            color: Colors.white,
                            fontFamily: 'roboto',
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                  ]),
                ),
                Expanded(
                  child: GetBuilder<KontakController>(
                    init: KontakController(),
                    initState: (state) {
                      KontakProvider kontakProvider = KontakProvider();
                      kontakProvider.getListKontak();
                    },
                    builder: (c) {
                      return c.kontak.isEmpty
                          ? ShimmerLoading(
                              isLoading: true,
                              child: ListView.builder(
                                  itemCount: 5,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: ListTile(
                                          leading: Container(
                                            height: 50,
                                            width: 50,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              gradient: shimmerGradient,
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.black
                                                        .withOpacity(0.1),
                                                    offset: const Offset(0, 1),
                                                    blurRadius: 15.0),
                                              ],
                                            ),
                                          ),
                                          title: Container(
                                            height: 20,
                                            decoration: BoxDecoration(
                                              gradient: shimmerGradient,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.black
                                                        .withOpacity(0.1),
                                                    offset: const Offset(0, 1),
                                                    blurRadius: 15.0),
                                              ],
                                            ),
                                          )),
                                    );
                                  }))
                          : ListView.builder(
                              itemCount: c.kontak.length,
                              itemBuilder: (context, index) {
                                String avatar =
                                    c.kontak[index].name!.split(' ')[0][0];
                                return Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: ListTile(
                                    onTap: () async {
                                      final Uri launchUri = Uri(
                                        scheme: 'tel',
                                        path: c.kontak[index].phoneNumber!,
                                      );
                                      await launchUrl(launchUri);
                                    },
                                    leading: Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        color: Colors.primaries[
                                            c.kontak[index].name!.length >= 18
                                                ? 17
                                                : c.kontak[index].name!.length],
                                        shape: BoxShape.circle,
                                      ),
                                      child: Center(
                                        child: CText(
                                          avatar,
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0xff37474F)
                                              .withOpacity(0.3),
                                        ),
                                      ),
                                    ),
                                    title: Text(
                                      c.kontak[index].name!,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                );
                              },
                            );
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
