import 'package:belajar_1/model/poli.dart';
import 'package:belajar_1/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';

class PoliDetail extends StatefulWidget {
  const PoliDetail({super.key, required this.poli});

  final Poli poli;

  @override
  State<StatefulWidget> createState() => PoliDetailState();
}

class PoliDetailState extends State<PoliDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(titleAppBar: "Detail Poli "),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Text(
            "Nama Poli : ${widget.poli.namaPoli}",
            style: const TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(onPressed: () {}, style: ElevatedButton.styleFrom(backgroundColor: Colors.green), child: const Text("Ubah")),
              ElevatedButton(onPressed: () {}, style: ElevatedButton.styleFrom(backgroundColor: Colors.red), child: const Text("Hapus")),
            ],
          )
        ],
      ),
    );
  }
}