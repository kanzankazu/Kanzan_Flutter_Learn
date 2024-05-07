import 'package:belajar_1/domain/entities/pegawai.dart';
import 'package:belajar_1/presentation/pages/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';

class PegawaiDetail extends StatefulWidget {
  const PegawaiDetail({super.key, required this.pegawai});

  final Pegawai pegawai;

  @override
  State<StatefulWidget> createState() => PegawaiDetailState();
}

class PegawaiDetailState extends State<PegawaiDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Detail Poli "),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Text(
            "Nama Poli : ${widget.pegawai.nama}",
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
