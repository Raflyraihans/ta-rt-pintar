import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rtkita/app/modules/Manajemen_Iuran/views/detail_pembayaran.dart';
import 'package:rtkita/app/modules/donation/controllers/donation_controller.dart';
import 'package:rtkita/app/modules/donation/views/detail.dart';
import 'package:rtkita/app/providers/donation.dart';
import 'package:rtkita/app/utils/currency_format.dart';
import 'package:rtkita/env/color.dart';
import 'package:rtkita/widgets/body_builder.dart';
import 'package:rtkita/widgets/text.dart';

import '../controllers/manajemen_iuran_controller.dart';

class ManajemenIuranView extends GetView<ManajemenIuranController> {
  ManajemenIuranView({Key? key}) : super(key: key);
  final DonationProvider donationProvider = DonationProvider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: BodyBuilder(
          child: SafeArea(
              child: Column(children: [
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
                      'Manajemen Iuran',
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
              child: GetBuilder<ManajemenIuranController>(
                  init: ManajemenIuranController(),
                  initState: (state) {
                    DonationProvider donationProvider = DonationProvider();
                    donationProvider.getListReceiveDonation();
                  },
                  builder: (c) {
                    return ListView.builder(
                        itemCount: c.payments.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Get.to(() =>
                                  DetailPembayaranView(c.payments[index]));
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 24, vertical: 12),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      offset: const Offset(0, 1),
                                      blurRadius: 15.0),
                                ],
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 12,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            CText(
                                              CurrencyFormat.convertToIdr(
                                                  int.tryParse(c.payments[index]
                                                      .donationAmount!
                                                      .replaceAll('Rp. ', '')
                                                      .replaceAll('.', '')),
                                                  0),
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            // CText(
                                            //   c.payments[index].donationAmount!,
                                            //   fontSize: 14,
                                            //   fontWeight: FontWeight.bold,
                                            // ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 12,
                                        ),
                                        CText(
                                                "Tujuan : ${c.payments[index].donation?['title']}",
                                                fontSize: 14,
                                              ),
                                        const SizedBox(
                                          height: 12,
                                        ),
                                        CText(
                                          "Dari : ${c.payments[index].familyMember!['family_member_name']}",
                                          fontSize: 14,
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        CText(
                                          "Tanggal : ${c.convertDate(c.payments[index].createdAt!)}",
                                          fontSize: 14,
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                  }),
            )
          ])),
        ));
  }
}
