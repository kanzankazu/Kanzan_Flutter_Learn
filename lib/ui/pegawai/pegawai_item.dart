import 'package:belajar_flutter/model/pegawai.dart';
import 'package:belajar_flutter/ui/pegawai/pegawai_detail.dart';
import 'package:flutter/material.dart';

class PegawaiItem extends StatelessWidget {
  const PegawaiItem({super.key, required this.pegawai});

  final Pegawai pegawai;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => PegawaiDetail(pegawai: pegawai)));
      },
      child: Card(
        child: ListTile(
          title: Text(pegawai.nama),
        ),
      ),
    );
  }
}
