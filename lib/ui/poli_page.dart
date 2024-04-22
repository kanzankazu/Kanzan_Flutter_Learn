import 'package:belajar_1/model/poli.dart';
import 'package:belajar_1/ui/poli_detail.dart';
import 'package:belajar_1/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';

class PoliPage extends StatefulWidget {
  const PoliPage({super.key});

  @override
  State<StatefulWidget> createState() => PoliPageState();
}

class PoliPageState extends State<PoliPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        titleAppBar: "Data Poli",
      ),
      body: ListView(
        children: [
          GestureDetector(
            child: const Card(
              child: ListTile(
                title: Text("Poli Anak"),
              ),
            ),
            onTap: () {
              Poli poli = Poli(namaPoli: "Poli Anak");
              Navigator.push(context, MaterialPageRoute(builder: (context) => PoliDetail(poli: poli)));
            },
          ),
          GestureDetector(
            child: const Card(
              child: ListTile(
                title: Text("Poli Kandungan"),
              ),
            ),
            onTap: () {
              Poli poli = Poli(namaPoli: "Poli Kandungan");
              Navigator.push(context, MaterialPageRoute(builder: (context) => PoliDetail(poli: poli)));
            },
          ),
          GestureDetector(
            child: const Card(
              child: ListTile(
                title: Text("Poli Gigi"),
              ),
            ),
            onTap: () {
              Poli poli = Poli(namaPoli: "Poli Gigi");
              Navigator.push(context, MaterialPageRoute(builder: (context) => PoliDetail(poli: poli)));
            },
          ),
          GestureDetector(
              child: const Card(
                child: ListTile(
                  title: Text("Poli THT"),
                ),
              ),
              onTap: () {
                Poli poli = Poli(namaPoli: "Poli THT");
                Navigator.push(context, MaterialPageRoute(builder: (context) => PoliDetail(poli: poli)));
              }),
        ],
      ),
    );
  }
}
