// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:rtkita/widgets/button.dart';

class SimpleBoxDialog extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String buttonText;
  final String secondaryButtonText;
  final VoidCallback? onTapPrimary;
  final VoidCallback? onTapSecondary;
  final Widget? child;
  const SimpleBoxDialog(
      {Key? key,
      required this.title,
      this.subtitle,
      this.buttonText = '',
      this.secondaryButtonText = '',
      this.onTapPrimary,
      this.onTapSecondary,
      this.child})
      : super(key: key);

  dialogContent(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min, // To make the card compact
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w700,
                color: Color(0xff222222),
              ),
            ),
            SizedBox(height: 10),
            Text(
              subtitle ?? '',
              style: TextStyle(
                fontSize: 14.0,
                color: Color(0xff222222),
                fontWeight: FontWeight.w400,
              ),
            ),
            child ?? Container(),
            SizedBox(height: 24.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                secondaryButtonText == ''
                    ? Container()
                    : Expanded(
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 4),
                          child: SecondaryButton(
                            text: secondaryButtonText,
                            onTap: onTapSecondary ?? () {},
                          ),
                        ),
                      ),
                buttonText == ''
                    ? Container()
                    : Expanded(
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 4),
                          child: PrimaryButton(
                            text: buttonText,
                            onTap: onTapPrimary ?? () {},
                          ),
                        ),
                      ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }
}
