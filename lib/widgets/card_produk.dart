import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rtkita/app/components/dialog.dart';
import 'package:rtkita/app/utils/currency_format.dart';
import 'package:rtkita/env/color.dart';
import 'package:rtkita/widgets/button.dart';
import 'package:rtkita/widgets/text.dart';
import 'package:url_launcher/url_launcher.dart';

class CardProduk extends StatelessWidget {
  final String title;
  final String penjual;
  final String harga;
  final String picture;
  const CardProduk(
      {Key? key,
      required this.title,
      required this.penjual,
      required this.harga,
      required this.picture})
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
              Container(
                height: 100,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    color: Colors.grey),
                child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: picture,
                      height: 100,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    )),
              ),
            ],
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 8,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CText(
                    title,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  CText(
                    CurrencyFormat.convertToIdr(int.parse(harga), 0),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  CText(
                    penjual,
                    fontSize: 14,
                    color: subtextColor,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Expanded(
                    child: PrimaryButton(
                        text: 'Beli',
                        onTap: () async {
                          var whatsappUrl =
                              "whatsapp://send?phone=+6285254257455";
                          await canLaunchUrl(Uri.parse(whatsappUrl))
                              ? launchUrl(Uri.parse(whatsappUrl))
                              : errorMessage('Whatsapp not installed');
                        }),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
