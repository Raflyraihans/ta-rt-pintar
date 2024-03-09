import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:rtkita/app/modules/persuratan/views/detail_add_persuratan_view.dart';
import 'package:rtkita/app/providers/persuratan.dart';
import 'package:rtkita/env/color.dart';
import 'package:rtkita/widgets/text.dart';

class CardSurat extends StatelessWidget {
  final String text;
  CardSurat({Key? key, required this.text}) : super(key: key);

  final PersuratanProvider persuratanProvider = PersuratanProvider();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
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
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {
            persuratanProvider.getFamilyData(context);
            Get.to(() => DetailAddPersuratanView(text));
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset('assets/image/word.svg'),
                    const SizedBox(
                      width: 12,
                    ),
                    CText(
                      text,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
                Icon(
                  FluentIcons.edit_24_regular,
                  color: subtextColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
