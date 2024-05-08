import 'package:belajar_flutter/presentation/pages/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';

class PegawaiPage extends StatefulWidget {
  const PegawaiPage({super.key});

  @override
  State<StatefulWidget> createState() => PegawaiPageState();
}

class PegawaiPageState extends State<PegawaiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Data Pegawai"),
      body: ListView(
        children: const [],
      ),
    );
  }
}
