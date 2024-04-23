import 'package:belajar_1/model/poli.dart';
import 'package:belajar_1/ui/poli/poli_detail.dart';
import 'package:belajar_1/widget/custom_app_bar.dart';
import 'package:belajar_1/widget/custom_gesturedetector_card.dart';
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
      appBar: const CustomAppBar(
        title: "Data Poli",
      ),
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
