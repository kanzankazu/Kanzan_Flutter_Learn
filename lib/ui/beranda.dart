// ignore_for_file: prefer_const_constructors

import 'package:belajar_1/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';

class Beranda extends StatelessWidget {
  const Beranda({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Beranda"),
      body: Center(
        child: Text("Selamat Datang"),
      ),
    );
  }
}
