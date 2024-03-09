import 'package:flutter/material.dart';
import 'package:rtkita/widgets/text.dart';

class CardBerita extends StatelessWidget {
  final String account;
  final String description;
  final String time;
  final String picture;
  const CardBerita(
      {Key? key,
      required this.account,
      required this.description,
      required this.time,
      required this.picture})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    child: Image.network(
                      picture,
                      height: 160,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    )),
              ),
              Positioned(
                top: 15,
                left: 15,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: CText(
                    time,
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
              vertical: 12,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CText(
                      account,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                CText(
                  description,
                  fontSize: 14,
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
