import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rtkita/app/utils/currency_format.dart';
import 'package:rtkita/widgets/body_builder.dart';
import 'package:rtkita/widgets/text.dart';

import '../controllers/iuran_controller.dart';

class IuranView extends GetView<IuranController> {
  const IuranView({Key? key}) : super(key: key);
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
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(4),
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
                      'Iuran Warga',
                      style: TextStyle(
                        // ignore: unnecessary_const
                        color: Color(0xff25446F),
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
                child: ListView.builder(
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      var avatar =
                          "https://images.unsplash.com/photo-1593113646773-028c64a8f1b8?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D";
                      return InkWell(
                        onTap: () {
                          Get.to(() {});
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
                              Stack(
                                children: [
                                  Container(
                                    height: 160,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                      ),
                                    ),
                                    child: ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20),
                                        ),
                                        child: CachedNetworkImage(
                                            imageUrl: avatar,
                                            height: 160,
                                            width: double.infinity,
                                            fit: BoxFit.cover,
                                            placeholder: (context, err) {
                                              return Container(
                                                  height: 160,
                                                  decoration: BoxDecoration(
                                                    color: Colors.grey
                                                        .withOpacity(0.5),
                                                    borderRadius:
                                                        const BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(20),
                                                      topRight:
                                                          Radius.circular(20),
                                                    ),
                                                  ),
                                                  child: const Center(
                                                    child:
                                                        CircularProgressIndicator(
                                                      color: Colors.white,
                                                    ),
                                                  ));
                                            })),
                                  ),
                                ],
                              ),
                              Container(
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 12,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        CText(
                                          "  c.donation[index].title!",
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    CText(
                                      "c.donation[index].description!",
                                      fontSize: 14,
                                    ),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    CText(
                                      "Nomor rekening: ",
                                      fontSize: 14,
                                    ),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    CText(
                                      CurrencyFormat.convertToIdr(
                                          int.parse("100000"), 0),
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
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
                    })

                //  GetBuilder<DonationController>(
                //     init: DonationController(),
                //     initState: (state) {
                //       DonationProvider donationProvider = DonationProvider();
                //       donationProvider.getListDonation();
                //     },
                //     builder: (c) {

                //     }),
                )
          ])),
        ));
  }
}
