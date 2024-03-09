import 'package:flutter/material.dart';

import 'package:get/get.dart';

class TermsView extends GetView {
  const TermsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        backgroundColor: Colors.white,
        title: const Text(
          'Terms & Condition',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
      ),
    );
  }
}
