import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rtkita/app/modules/aduan/views/add_aduan_view.dart';
import 'package:rtkita/app/modules/aduan/views/detail_aduan_view.dart';
import 'package:rtkita/app/providers/complaint.dart';
import 'package:rtkita/env/color.dart';
import 'package:rtkita/widgets/body_builder.dart';
import 'package:rtkita/widgets/card_aduan.dart';
import 'package:rtkita/widgets/shimmer_loading.dart';

import '../controllers/aduan_controller.dart';

class AduanView extends GetView<AduanController> {
  AduanView({Key? key}) : super(key: key);

  final AduanProvider aduanProvider = AduanProvider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Shimmer(
        linearGradient: shimmerGradient,
        child: SafeArea(
          child: Stack(
            children: [
              Column(
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
                      const Expanded(
                        flex: 2,
                        child: Center(
                          child: Text(
                            'Aduan Warga',
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 12),
                      child: ListView(
                        children: [
                          const SizedBox(
                            height: 12,
                          ),
                          GetBuilder<AduanController>(
                            init: AduanController(),
                            builder: (c) {
                              return c.aduan! == null
                                  ? ShimmerLoading(
                                      isLoading: true,
                                      child: GridView.builder(
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemCount: 4,
                                        gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 2,
                                                childAspectRatio: 8 / 10),
                                        itemBuilder: (context, snapshot) {
                                          return Container(
                                            margin: const EdgeInsets.symmetric(
                                                vertical: 10, horizontal: 12),
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
                                          );
                                        },
                                      ),
                                    )
                                  : GridView.builder(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount: c.aduan!.length,
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,
                                              childAspectRatio: 8 / 10),
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                          onTap: () {
                                            Get.to(() => DetailAduanView(
                                                c.aduan![index]));
                                          },
                                          child: CardAduan(
                                              document: c
                                                      .aduan![index]
                                                      .complaintDocuments!
                                                      .isEmpty
                                                  ? 'https://jdih.kominfo.go.id/storage/pictures/default.jpg'
                                                  : c
                                                      .aduan![index]
                                                      .complaintDocuments![0]
                                                      .document!,
                                              title: c.aduan![index].title!,
                                              description:
                                                  c.aduan![index].description!,
                                              status: c.aduan![index].status!,
                                              tanggal: c.aduan![index].createdAt!
                                                  .split('T')
                                                  .first),
                                        );
                                      },
                                    );
                            },
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Positioned(
                bottom: 30,
                right: 30,
                child: Container(
                  height: 65,
                  width: 65,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.10),
                          offset: const Offset(0, 1),
                          blurRadius: 8.0),
                    ],
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      customBorder: const CircleBorder(),
                      onTap: () {
                        Get.to(() => AddAduanView());
                      },
                      child: const Center(
                        child: Icon(
                          FluentIcons.add_24_regular,
                          size: 30,
                          color: Colors.white,
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
