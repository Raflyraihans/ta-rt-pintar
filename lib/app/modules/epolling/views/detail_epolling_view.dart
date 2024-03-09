import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rtkita/app/components/dialog.dart';
import 'package:rtkita/app/model/polling.dart';
import 'package:rtkita/app/modules/epolling/controllers/epolling_controller.dart';
import 'package:rtkita/app/providers/polling.dart';
import 'package:rtkita/env/color.dart';
import 'package:rtkita/widgets/body_builder.dart';
import 'package:rtkita/widgets/text.dart';

class DetailEpollingView extends GetView {
  final Polling? polling;
  DetailEpollingView(this.polling, {Key? key}) : super(key: key);
  final PollingProvider pollingProvider = PollingProvider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
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
              child: BodyBuilder(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 22,
                      ),
                      CText(
                        polling!.title!,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      CText(polling!.description!,
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Row(
                        children: [
                          Icon(
                            FluentIcons.alert_24_regular,
                            color: dangerRed,
                            size: 16,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          CText(
                            ': Pilih salah satu',
                            color: dangerRed,
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      GetBuilder<EpollingController>(
                        init: EpollingController(),
                        initState: (state) {
                          pollingProvider
                              .getDetailPolling(polling!.id.toString());
                        },
                        builder: (c) {
                          int totalVote = 0;
                          print("polling options : ${polling!}");
                          for (var element in polling!.pollingOptions!) {
                            totalVote = totalVote + int.parse(element.vote!);
                          }
                          return ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: polling?.pollingOptions!.length,
                            itemBuilder: (context, index) {
                              double percent = int.parse(
                                      polling!.pollingOptions![index].vote!) /
                                  totalVote;
                              return GestureDetector(
                                onTap: () {
                                  if (c.dataPolling == null) {
                                    confirmMessage(
                                        context,
                                        'Apakah anda yakin?',
                                        'Pilihan voting tidak dapat diubah',
                                        () {
                                      Get.back();
                                      pollingProvider.selectPolling(
                                          context,
                                          polling!.pollingOptions![index].id,
                                          polling!.id.toString());
                                      pollingProvider.getListPolling();
                                    });
                                  }
                                },
                                child: Stack(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 15),
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20),
                                        boxShadow: [
                                          BoxShadow(
                                              color:
                                                  Colors.black.withOpacity(0.1),
                                              offset: const Offset(0, 1),
                                              blurRadius: 15.0),
                                        ],
                                      ),
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 20,
                                            width: 20,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  color: subtextColor),
                                            ),
                                            child: c.dataPolling == null
                                                ? Container()
                                                : c.dataPolling['id'] ==
                                                        polling!
                                                            .pollingOptions![
                                                                index]
                                                            .id
                                                    ? Center(
                                                        child: Container(
                                                          height: 12,
                                                          width: 12,
                                                          decoration: BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                              color:
                                                                  primaryColor),
                                                        ),
                                                      )
                                                    : Container(),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          CText(
                                            polling!.pollingOptions![index]
                                                .optionName!,
                                            color: Colors.black,
                                          ),
                                        ],
                                      ),
                                    ),
                                    c.dataPolling == null
                                        ? Container()
                                        : Positioned(
                                            top: 0,
                                            bottom: 0,
                                            left: 0,
                                            right: 0,
                                            child: SizedBox(
                                              width: 100,
                                              child: Row(
                                                children: [
                                                  Flexible(
                                                    child: LayoutBuilder(builder:
                                                        (context, constraints) {
                                                      return Container(
                                                        width: percent *
                                                            constraints.maxWidth,
                                                        padding: const EdgeInsets
                                                            .symmetric(
                                                            horizontal: 20,
                                                            vertical: 15),
                                                        margin: const EdgeInsets
                                                            .symmetric(
                                                            vertical: 10),
                                                        decoration: BoxDecoration(
                                                          color: secondaryColor
                                                              .withOpacity(0.3),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
                                                        ),
                                                      );
                                                    }),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                    c.dataPolling == null
                                        ? Container()
                                        : Positioned(
                                            right: 24,
                                            top: 0,
                                            bottom: 0,
                                            child: Center(
                                              child: CText(
                                                  '${(percent * 100).toString().split('.')[0]}%',
                                                  color: subtextColor),
                                            ),
                                          )
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
