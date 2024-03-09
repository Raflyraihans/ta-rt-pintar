// ignore_for_file: non_constant_identifier_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rtkita/env/color.dart';
import 'package:rtkita/widgets/full_screen_image.dart';
import 'package:rtkita/widgets/text.dart';

class ChatBubble extends StatelessWidget {
  final bool other;
  final String username;
  final String message;
  final String created_at;
  final String? file;
  const ChatBubble(
      {super.key,
      required this.other,
      required this.username,
      required this.message,
      required this.created_at,
      this.file});

  @override
  Widget build(BuildContext context) {
    return other == true
        ? Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    constraints:
                        const BoxConstraints(minWidth: 50, maxWidth: 230),
                    margin: const EdgeInsets.only(
                        left: 24, right: 24, top: 12, bottom: 12),
                    padding: const EdgeInsets.only(
                        left: 12, right: 12, top: 12, bottom: 32),
                    decoration: BoxDecoration(
                      color: const Color(0xffEEF4FD),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              constraints: const BoxConstraints(
                                  minWidth: 50, maxWidth: 200),
                              child: CText(username,
                                  color: primaryColor,
                                  maxLines: 1,
                                  fontSize: 15,
                                  overflow: TextOverflow.clip,
                                  fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(height: 4),
                            message == 'Mengirim foto..'
                                ? Container()
                                : Container(
                                    constraints: const BoxConstraints(
                                        minWidth: 50, maxWidth: 200),
                                    child: CText(message)),
                            file != ''
                                ? file == 'file'
                                    ? Container(
                                        height: 200,
                                        width: 200,
                                        decoration: BoxDecoration(
                                          color: Colors.grey.withOpacity(0.5),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: const Center(
                                          child: CircularProgressIndicator(
                                            color: Colors.white,
                                          ),
                                        ))
                                    : GestureDetector(
                                        onTap: () {
                                          // Get.to(() =>
                                          //     FullScreenImage(image: file!));
                                        },
                                        child: Container(
                                          margin: const EdgeInsets.symmetric(
                                              vertical: 10),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Hero(
                                              tag: file!,
                                              child: CachedNetworkImage(
                                                  imageUrl: file!,
                                                  fit: BoxFit.cover,
                                                  height: 200,
                                                  width: 200,
                                                  placeholder: (context, err) {
                                                    return Container(
                                                        height: 200,
                                                        width: 200,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.grey
                                                              .withOpacity(0.5),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        ),
                                                        child: const Center(
                                                          child:
                                                              CircularProgressIndicator(
                                                            color: Colors.white,
                                                          ),
                                                        ));
                                                  }),
                                            ),
                                          ),
                                        ),
                                      )
                                : Container()
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    right: 36,
                    child: created_at == ''
                        ? const Icon(FluentIcons.clock_24_regular)
                        : CText(
                            DateFormat('kk:mm')
                                .format(DateTime.parse(created_at)
                                    .add(const Duration(hours: 8)))
                                .toString(),
                            color: subtextColor),
                  ),
                ],
              ),
            ],
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Stack(
                children: [
                  Container(
                    constraints:
                        const BoxConstraints(minWidth: 50, maxWidth: 230),
                    margin: const EdgeInsets.only(
                        left: 24, right: 24, top: 12, bottom: 12),
                    padding: const EdgeInsets.only(
                        left: 12, right: 12, top: 12, bottom: 32),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.withOpacity(0.5)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            message == 'Mengirim foto..'
                                ? Container()
                                : Container(
                                    constraints: const BoxConstraints(
                                        minWidth: 50, maxWidth: 200),
                                    child: CText(message)),
                            file != ''
                                ? file == 'file'
                                    ? Container(
                                        height: 200,
                                        width: 200,
                                        decoration: BoxDecoration(
                                          color: Colors.grey.withOpacity(0.5),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: const Center(
                                          child: CircularProgressIndicator(
                                            color: Colors.white,
                                          ),
                                        ))
                                    : GestureDetector(
                                        onTap: () {
                                          // Get.to(() =>
                                          //     FullScreenImage(image: file!));
                                        },
                                        child: Container(
                                          margin: const EdgeInsets.symmetric(
                                              vertical: 10),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: CachedNetworkImage(
                                                imageUrl: file!,
                                                fit: BoxFit.cover,
                                                height: 200,
                                                width: 200,
                                                placeholder: (context, err) {
                                                  return Container(
                                                      height: 200,
                                                      width: 200,
                                                      decoration: BoxDecoration(
                                                        color: Colors.grey
                                                            .withOpacity(0.5),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      child: const Center(
                                                        child:
                                                            CircularProgressIndicator(
                                                          color: Colors.white,
                                                        ),
                                                      ));
                                                }),
                                          ),
                                        ),
                                      )
                                : Container()
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    right: 36,
                    child: created_at == ''
                        ? Icon(FluentIcons.clock_24_regular,
                            size: 12, color: subtextColor)
                        : CText(
                            DateFormat('kk:mm')
                                .format(DateTime.parse(created_at)
                                    .add(const Duration(hours: 8)))
                                .toString(),
                            color: subtextColor),
                  ),
                ],
              ),
            ],
          );
  }
}
