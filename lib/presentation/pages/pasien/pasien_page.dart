import 'package:belajar_flutter/domain/entities/poli.dart';
import 'package:belajar_flutter/presentation/pages/poli/poli_detail.dart';
import 'package:belajar_flutter/presentation/pages/widget/custom_app_bar.dart';
import 'package:belajar_flutter/presentation/pages/widget/custom_gesturedetector_card.dart';
import 'package:flutter/material.dart';

class PasienPage extends StatefulWidget {
  const PasienPage({super.key});

  @override
  State<StatefulWidget> createState() => PasienPageState();
}

class PasienPageState extends State<PasienPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Data Pasien"),
      body: ListView(
        children: [
          CustomCardGestureDetector(
              title: "Poli Anak",
              onTap: () {
                Poli poli = Poli(namaPoli: "Poli Anak");
                Navigator.push(context, MaterialPageRoute(builder: (context) => PoliDetail(poli: poli)));
              }),
          CustomCardGestureDetector(
              title: "Poli Kandungan",
              onTap: () {
                Poli poli = Poli(namaPoli: "Poli Kandungan");
                Navigator.push(context, MaterialPageRoute(builder: (context) => PoliDetail(poli: poli)));
              }),
          CustomCardGestureDetector(
              title: "Poli Gigi",
              onTap: () {
                Poli poli = Poli(namaPoli: "Poli Gigi");
                Navigator.push(context, MaterialPageRoute(builder: (context) => PoliDetail(poli: poli)));
              }),
          CustomCardGestureDetector(
              title: "Poli THT",
              onTap: () {
                Poli poli = Poli(namaPoli: "Poli THT");
                Navigator.push(context, MaterialPageRoute(builder: (context) => PoliDetail(poli: poli)));
              }),
        ],
      ),
    );
  }
}
