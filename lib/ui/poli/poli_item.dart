import 'package:belajar_1/model/poli.dart';
import 'package:belajar_1/ui/poli/poli_detail.dart';
import 'package:flutter/material.dart';

class PoliItem extends StatelessWidget {
  const PoliItem({super.key, required this.poli});

  final Poli poli;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => PoliDetail(poli: poli)));
      },
      child: Card(
        child: ListTile(
          title: Text(poli.namaPoli),
        ),
      ),
    );
  }
}
