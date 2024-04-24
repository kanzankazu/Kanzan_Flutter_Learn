import 'package:belajar_1/model/poli.dart';
import 'package:flutter/material.dart';

class PoliItem extends StatelessWidget {
  const PoliItem({super.key, required this.poli, this.onTapNew});

  final Poli poli;
  final Function()? onTapNew;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: /*() {
        Navigator.push(context, MaterialPageRoute(builder: (context) => PoliDetail(poli: poli)));
      }*/onTapNew,
      child: Container(
        padding: const EdgeInsets.only(bottom: 8),
        child: Card(
          child: ListTile(
            title: Text(poli.namaPoli),
          ),
        ),
      ),
    );
  }
}
