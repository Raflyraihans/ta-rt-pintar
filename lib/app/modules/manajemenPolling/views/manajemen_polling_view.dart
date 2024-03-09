import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rtkita/app/modules/aduan/views/detail_aduan_view.dart';
import 'package:rtkita/app/modules/epolling/controllers/epolling_controller.dart';
import 'package:rtkita/app/modules/manajemenPolling/controllers/manajemen_polling_controller.dart';
import 'package:rtkita/app/modules/manajemenPolling/views/tambah_polling_view.dart';
import 'package:rtkita/app/providers/complaint.dart';
import 'package:rtkita/app/providers/polling.dart';
import 'package:rtkita/env/color.dart';
import 'package:rtkita/widgets/body_builder.dart';
import 'package:rtkita/widgets/button.dart';
import 'package:rtkita/widgets/text.dart';

class ManajemenPollingView extends GetView<ManajemenPollingController> {
  const ManajemenPollingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    ManajemenPollingController manajemenPollingController =
        Get.put(ManajemenPollingController());
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
                        'Manajemen Polling',
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
                child: Stack(
                  children: [
                    GetBuilder<EpollingController>(
                      init: EpollingController(),
                      initState: (state) {
                        PollingProvider pollingProvider = PollingProvider();
                        pollingProvider.getListPolling(isAll: true);
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
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
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
                                        },
                                        child: Row(
                                          children: [
                                            c.polling[index]!.status == 'finish'
                                                ? CText(
                                                    'Selesai',
                                                    color: subtextColor,
                                                    fontWeight: FontWeight.w500,
                                                  )
                                                : c.polling[index]!.status == 'pending' ? CText(
                                                    'Pending',
                                                    color: Colors.orange,
                                                    fontWeight: FontWeight.w500,
                                                  ) : CText(
                                                    'Belangsung',
                                                    color: primaryColor,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  ListView.builder(
                                    shrinkWrap: true,
                                    physics: const NeverScrollableScrollPhysics(),
                                    itemCount: c.polling[index]!.pollingOptions!.length,
                                    itemBuilder: (context, i){
                                      return Row(
                                        children: [
                                          Icon(Icons.circle, color: primaryColor, size: 10,),
                                          const SizedBox(width: 4,),
                                          CText(
                                            c.polling[index]!.pollingOptions![i].optionName!,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    ),
                    Positioned(
                      bottom: 20,
                      right: 20,
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: IconButton(
                          onPressed: (){
                            Get.to(TambahPolling());
                          },
                          color: Colors.white,
                          icon: const Icon(Icons.add),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
