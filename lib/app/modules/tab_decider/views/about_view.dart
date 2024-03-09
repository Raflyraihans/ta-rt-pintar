import 'package:flutter/material.dart';

import 'package:get/get.dart';

class AboutView extends GetView {
  const AboutView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        backgroundColor: Colors.white,
        title: const Text(
          'About App',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [Text('Ini adalah rilis pertama Aplikasi RT Pintar.')],
        ),
      ),
    );
  }
}
