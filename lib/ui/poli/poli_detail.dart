import 'package:belajar_1/model/poli.dart';
import 'package:belajar_1/ui/poli/poli_form_add_edit.dart';
import 'package:belajar_1/ui/poli/poli_page.dart';
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
      appBar: const CustomAppBar(title: "Detail Poli "),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Card(
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: Text(
                    "Nama Poli : ${widget.poli.namaPoli}",
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _ubahButton(),
                    _hapusButton(),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _ubahButton() => ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (c) => PoliFormAddEdit(poli: widget.poli)),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
      ),
      child: const Text(
        "Ubah",
        style: TextStyle(
          color: Colors.black,
          decorationColor: Colors.green,
          decorationStyle: TextDecorationStyle.wavy,
        ),
      ));

  _hapusButton() => ElevatedButton(
      onPressed: () {
        AlertDialog alertDialog = AlertDialog(
          content: const Text("Yakin ingin menghapus data ini?"),
          actions: [
            // tombol ya
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const PoliPage()));
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: const Text("YA",
                  style: TextStyle(
                    color: Colors.black,
                    decorationColor: Colors.green,
                    decorationStyle: TextDecorationStyle.wavy,
                  )),
            ),
// tombol batal
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              child: const Text("Tidak",
                  style: TextStyle(
                    color: Colors.black,
                    decorationColor: Colors.green,
                    decorationStyle: TextDecorationStyle.wavy,
                  )),
            )
          ],
        );
        showDialog(
            context: context,
            builder: (c) {
              return alertDialog;
            });
      },
      style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
      child: const Text("Hapus",
          style: TextStyle(
            color: Colors.black,
            decorationColor: Colors.green,
            decorationStyle: TextDecorationStyle.wavy,
          )));
}
