import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:rtkita/app/model/cover_letter.dart';
import 'package:rtkita/app/providers/persuratan.dart';
import 'package:rtkita/app/utils/string.dart';
import 'package:rtkita/env/color.dart';
import 'package:rtkita/widgets/button.dart';
import 'package:rtkita/widgets/shimmer_loading.dart';
import 'package:rtkita/widgets/text.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controllers/manajemen_persuratan_controller.dart';

class ManajemenPersuratanView extends GetView<ManajemenPersuratanController> {
  const ManajemenPersuratanView({Key? key}) : super(key: key);
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
                      // ignore: prefer_const_constructors
                      Expanded(
                        flex: 2,
                        child: const Center(
                          child: Text(
                            'Manajemen Persuratan',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'roboto',
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
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
                    child: SingleChildScrollView(
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 12),
                        child: Column(
                          children: [
                            // TextField(
                            //   decoration: InputDecoration(
                            //     border: OutlineInputBorder(
                            //         borderRadius: BorderRadius.circular(10)),
                            //     hintText: 'Cari Surat',
                            //     prefixIcon:
                            //         const Icon(FluentIcons.search_24_regular),
                            //   ),
                            // ),
                            GetBuilder<ManajemenPersuratanController>(
                                init: ManajemenPersuratanController(),
                                initState: (state) {
                                  final PersuratanProvider persuratanProvider =
                                      PersuratanProvider();
                                  persuratanProvider.getPengurusListSurat();
                                },
                                builder: (c) {
                                  return c.manajemenPersuratan == null
                                      ? ShimmerLoading(
                                          isLoading: true,
                                          child: Column(
                                            children: [
                                              Container(
                                                height: 245,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 20,
                                                        vertical: 15),
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 10),
                                                decoration: BoxDecoration(
                                                  gradient: shimmerGradient,
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Colors.black
                                                            .withOpacity(0.1),
                                                        offset:
                                                            const Offset(0, 1),
                                                        blurRadius: 15.0),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                height: 245,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 20,
                                                        vertical: 15),
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 10),
                                                decoration: BoxDecoration(
                                                  gradient: shimmerGradient,
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Colors.black
                                                            .withOpacity(0.1),
                                                        offset:
                                                            const Offset(0, 1),
                                                        blurRadius: 15.0),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      : ListView.builder(
                                          shrinkWrap: true,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemCount:
                                              c.manajemenPersuratan!.length,
                                          itemBuilder: (context, index) {
                                            List tanggal = c
                                                .manajemenPersuratan![index]!
                                                .createdAt!
                                                .split('T')
                                                .first
                                                .split('-');
                                            return Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 24,
                                                      vertical: 24),
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 10),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Colors.black
                                                          .withOpacity(0.1),
                                                      offset:
                                                          const Offset(0, 1),
                                                      blurRadius: 15.0),
                                                ],
                                              ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  CText(
                                                    c
                                                        .manajemenPersuratan![
                                                            index]!
                                                        .title
                                                        .toString(),
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                  const SizedBox(
                                                    height: 8,
                                                  ),
                                                  CText(
                                                      'Pemohon: ${c.manajemenPersuratan![index]!.createdBy!}'),
                                                  const SizedBox(
                                                    height: 8,
                                                  ),
                                                  CText(
                                                      'Dituju: ${c.manajemenPersuratan![index]!.familyMember!.familyMemberName!}'),
                                                  const SizedBox(
                                                    height: 8,
                                                  ),
                                                  CText(
                                                      '${'Tanggal: ' + tanggal[2] + '/' + tanggal[1]}/' +
                                                          tanggal[0]),
                                                  const SizedBox(
                                                    height: 8,
                                                  ),
                                                  Row(
                                                    children: [
                                                      const CText('Status: '),
                                                      const SizedBox(
                                                        width: 1,
                                                      ),
                                                      CText(
                                                        c
                                                            .manajemenPersuratan![
                                                                index]!
                                                            .status!
                                                            .toCapitalized(),
                                                        color: c
                                                                    .manajemenPersuratan![
                                                                        index]!
                                                                    .status! ==
                                                                'diterima'
                                                            ? Colors.green
                                                            : c.manajemenPersuratan![index]!
                                                                        .status! ==
                                                                    'menunggu'
                                                                ? Colors.orange
                                                                : Colors.red,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      )
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 12,
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              14),
                                                      border: Border.all(
                                                          color: subtextColor),
                                                    ),
                                                    child: Material(
                                                      color: Colors.transparent,
                                                      child: InkWell(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(14),
                                                        onTap: () async {
                                                          try {
                                                            await launchUrl(
                                                                Uri.parse(c
                                                                    .manajemenPersuratan![
                                                                        index]!
                                                                    .file
                                                                    .toString()),
                                                                mode: LaunchMode
                                                                    .externalApplication);
                                                          } on PlatformException {
                                                            // Handle err
                                                          } catch (err) {
                                                            // other types of Exceptions
                                                          }
                                                        },
                                                        child: Container(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(24),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Row(
                                                                children: [
                                                                  SvgPicture.asset(
                                                                      'assets/image/word.svg'),
                                                                  const SizedBox(
                                                                    width: 8,
                                                                  ),
                                                                  SizedBox(
                                                                    width: MediaQuery.of(context)
                                                                            .size
                                                                            .width *
                                                                        0.45,
                                                                    child:
                                                                        CText(
                                                                      c
                                                                          .manajemenPersuratan![
                                                                              index]!
                                                                          .title
                                                                          .toString()
                                                                          .replaceAll(
                                                                              'SURAT PENGANTAR',
                                                                              'Surat'),
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      fontSize:
                                                                          15,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      color: Colors
                                                                          .black,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Icon(
                                                                FluentIcons
                                                                    .arrow_download_24_regular,
                                                                color:
                                                                    subtextColor,
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 24,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Expanded(
                                                        child: SecondaryButton(
                                                            text: 'Tolak',
                                                            onTap: () {
                                                              final PersuratanProvider
                                                                  persuratanProvider =
                                                                  PersuratanProvider();
                                                              persuratanProvider
                                                                  .updateStatusSurat(
                                                                      c.manajemenPersuratan![index]!
                                                                          .id!,
                                                                      'ditolak');
                                                            }),
                                                      ),
                                                      const SizedBox(
                                                        width: 12,
                                                      ),
                                                      Expanded(
                                                        child: PrimaryButton(
                                                            text: 'Terima',
                                                            onTap: () {
                                                              final PersuratanProvider
                                                                  persuratanProvider =
                                                                  PersuratanProvider();
                                                              persuratanProvider
                                                                  .updateStatusSurat(
                                                                      c.manajemenPersuratan![index]!
                                                                          .id!,
                                                                      'diterima');
                                                            }),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        );
                                }),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
