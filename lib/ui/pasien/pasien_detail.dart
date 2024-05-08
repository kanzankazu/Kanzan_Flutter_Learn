import 'package:belajar_flutter/model/poli.dart';
import 'package:belajar_flutter/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';

class PasienDetail extends StatefulWidget {
  const PasienDetail({super.key, required this.poli});

  final Poli poli;

  @override
  State<StatefulWidget> createState() => PasienDetailState();
}

class PasienDetailState extends State<PasienDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Detail Poli "),
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