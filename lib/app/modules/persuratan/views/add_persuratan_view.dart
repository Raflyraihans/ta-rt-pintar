import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rtkita/env/color.dart';
import 'package:rtkita/widgets/card_surat.dart';

class AddPersuratanView extends GetView {
  const AddPersuratanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
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
                      'Buat Surat',
                      style: TextStyle(
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
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                child: Column(
                  children: [
                    // TextField(
                    //   decoration: InputDecoration(
                    //     border: OutlineInputBorder(
                    //         borderRadius: BorderRadius.circular(10)),
                    //     hintText: 'Cari Surat',
                    //     prefixIcon: const Icon(FluentIcons.search_24_regular),
                    //   ),
                    // ),
                    // const SizedBox(
                    //   height: 12,
                    // ),
                    Expanded(
                      child: ListView(
                        physics: BouncingScrollPhysics(),
                        children: [
                          CardSurat(text: 'Ahli Waris'),
                          CardSurat(text: 'Domisili Usaha'),
                          CardSurat(
                            text: 'Bertempat Tinggal Sementara',
                          ),
                          CardSurat(text: 'Domisili Bertempat Tinggal'),
                          CardSurat(text: 'Domisili Penduduk untuk WNA'),
                          CardSurat(text: 'Domisili Tempat Ibadah'),
                          CardSurat(text: 'Domisili Usaha'),
                          CardSurat(text: 'Domisili Yayasan'),
                          CardSurat(text: 'Kuasa Ahli Waris'),
                          CardSurat(text: 'Permohonan Kredit Bank'),
                          CardSurat(text: 'Perubahan Data orang yg sama'),
                          CardSurat(text: 'Surat Izin Keramaian Pertunjukan'),
                          CardSurat(text: 'Surat Ket. Menikah'),
                          CardSurat(text: 'Surat Keterangan'),
                          CardSurat(text: 'Surat Pengantar SKCK'),
                          CardSurat(text: 'Lainnya'),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
