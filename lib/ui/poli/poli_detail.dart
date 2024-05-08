import 'package:belajar_flutter/helper/poli_service.dart';
import 'package:belajar_flutter/model/poli.dart';
import 'package:belajar_flutter/ui/poli/poli_form_add_edit.dart';
import 'package:belajar_flutter/ui/poli/poli_page.dart';
import 'package:belajar_flutter/widget/custom_app_bar.dart';
import 'package:belajar_flutter/widget/custom_future_builder.dart';
import 'package:flutter/material.dart';

class PoliDetail extends StatefulWidget {
  const PoliDetail({super.key, required this.poli});

  final Poli poli;

  @override
  State<StatefulWidget> createState() => PoliDetailState();
}

class PoliDetailState extends State<PoliDetail> {
  late Poli poli;

  @override
  void initState() {
    poli = widget.poli;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Detail Poli "),
      body: CustomFutureBuilder(
        future: PoliService().getById(poli.id ?? ""),
        onSuccessWidget: (poli) {
          return poliDetailContain(poli);
        },
      ),
    );
  }

  poliDetailContain(Poli poli) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Card(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Text(
                  "Nama Poli : ${poli.namaPoli}",
                  style: const TextStyle(fontSize: 20),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  poliDetailUbahButton(),
                  poliDetailHapusButton(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  poliDetailUbahButton() {
    return ElevatedButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (c) => PoliFormAddEdit(poli: poli)));
        },
        style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
        child: const Text("Ubah", style: TextStyle(color: Colors.black, decorationColor: Colors.green, decorationStyle: TextDecorationStyle.wavy)));
  }

  poliDetailHapusButton() {
    return ElevatedButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (contextDialog) {
                return AlertDialog(
                  content: const Text("Yakin ingin menghapus data ini?"),
                  actions: [
                    ElevatedButton(
                      onPressed: () async {
                        await PoliService().delete(poli).then((value) {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const PoliPage()));
                        });
                      },
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                      child: const Text("YA", style: TextStyle(color: Colors.black, decorationColor: Colors.green, decorationStyle: TextDecorationStyle.wavy)),
                    ),
                    ElevatedButton(
                      onPressed: () => Navigator.pop(contextDialog),
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                      child: const Text("Tidak", style: TextStyle(color: Colors.black, decorationColor: Colors.green, decorationStyle: TextDecorationStyle.wavy)),
                    )
                  ],
                );
              });
        },
        style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
        child: const Text("Hapus", style: TextStyle(color: Colors.black, decorationColor: Colors.green, decorationStyle: TextDecorationStyle.wavy)));
  }

  Stream<Poli> getById(String id) async* {
    var data = await PoliService().getById(id);
    yield data;
  }
}
