import 'package:belajar_flutter/presentation/pages/home/sidebar.dart';
import 'package:belajar_flutter/presentation/pages/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';

class Beranda extends StatelessWidget {
  const Beranda({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      drawer: Sidebar(),
      appBar: CustomAppBar(title: "Beranda"),
      body: Center(
        child: Text("Selamat Datang"),
      ),
    );
  }
}
