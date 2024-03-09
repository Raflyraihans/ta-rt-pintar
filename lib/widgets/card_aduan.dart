import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rtkita/env/color.dart';
import 'package:rtkita/widgets/text.dart';

class CardAduan extends StatelessWidget {
  final String title;
  final String description;
  final String status;
  final String tanggal;
  final String document;
  const CardAduan(
      {Key? key,
      required this.title,
      required this.description,
      required this.status,
      required this.tanggal,
      required this.document})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
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
              Hero(
                tag: document,
                child: Container(
                  height: 100,
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
                        imageUrl: document,
                        height: 100,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        placeholder: (context, url) {
                          return Container(
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                ),
                                color: Colors.grey.withOpacity(0.4)),
                          );
                        },
                      )),
                ),
              ),
              Positioned(
                top: 15,
                left: 15,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                  decoration: BoxDecoration(
                    color: status == 'diselidiki'
                        ? Colors.orange
                        : status == 'diposting'
                            ? Colors.blue
                            : Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: CText(
                    status,
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 8,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CText(
                  tanggal,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: subtextColor,
                ),
                const SizedBox(
                  height: 8,
                ),
                CText(
                  title,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 8,
                ),
                CText(
                  description,
                  fontSize: 14,
                  color: subtextColor,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 8,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
