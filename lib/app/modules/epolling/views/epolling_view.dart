import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rtkita/app/modules/epolling/views/detail_epolling_view.dart';
import 'package:rtkita/app/providers/polling.dart';
import 'package:rtkita/env/color.dart';
import 'package:rtkita/widgets/body_builder.dart';
import 'package:rtkita/widgets/text.dart';

import '../controllers/epolling_controller.dart';

// ignore: must_be_immutable
class EpollingView extends GetView<EpollingController> {
  EpollingView({Key? key}) : super(key: key);

  EpollingController c = Get.put(EpollingController());
  final PollingProvider pollingProvider = PollingProvider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BodyBuilder(
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
                        'E-Polling',
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
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                  child: GetBuilder<EpollingController>(
                    init: EpollingController(),
                    initState: (state) {
                      PollingProvider pollingProvider = PollingProvider();
                      pollingProvider.getListPolling();
                    },
                    builder: (c) {
                      return ListView.builder(
                        itemCount: c.polling.length,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            margin: const EdgeInsets.symmetric(vertical: 10),
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
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CText(
                                        c.polling[index]!.title!,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      CText(
                                        c.polling[index]!.description!,
                                        fontSize: 13,
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 35,
                                ),
                                InkWell(
                                  onTap: () {
                                    Get.to(() =>
                                        DetailEpollingView(c.polling[index]));
                                  },
                                  child: Row(
                                    children: [
                                      c.polling[index]!.status == 'finish'
                                          ? CText(
                                              'Selesai',
                                              color: subtextColor,
                                              fontWeight: FontWeight.w500,
                                            )
                                          : CText(
                                              'Polling',
                                              color: primaryColor,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      Icon(
                                        Icons.keyboard_arrow_right,
                                        color:
                                            c.polling[index]!.status == 'finish'
                                                ? subtextColor
                                                : primaryColor,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
