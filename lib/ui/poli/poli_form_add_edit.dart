import 'package:belajar_1/model/poli.dart';
import 'package:belajar_1/ui/poli/poli_detail.dart';
import 'package:belajar_1/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';

class PoliFormAddEdit extends StatefulWidget {
  const PoliFormAddEdit({super.key, this.poli});

  final Poli? poli;

  @override
  State<StatefulWidget> createState() => PoliFormAddEditState();
}

class PoliFormAddEditState extends State<PoliFormAddEdit> {
  late final _formKey = GlobalKey<FormState>();
  late final _namaPoliCtrl = TextEditingController();

  String titleToolbar = "";
  String titleButton = "";

  var _isPoliNull = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _isPoliNull = widget.poli.isNull();
      _namaPoliCtrl.text = (_isPoliNull == false ? widget.poli!.namaPoli : "");
    });
  }

  @override
  Widget build(BuildContext context) {
    titleToolbar = _isPoliNull == false ? "Ubah Poli" : "Tambah Poli";
    titleButton = _isPoliNull == false ? "Simpan Perubahan" : "Simpan";

    return Scaffold(
      appBar: CustomAppBar(title: titleToolbar),
      body: SingleChildScrollView(
        child: Form(
            key: _formKey,
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Card(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [_fieldNamaPoli(), _tombolSimpan()],
                  ),
                ),
              ),
            )),
      ),
    );
  }

  _fieldNamaPoli() {
    return Container(
      margin: const EdgeInsets.all(16),
      child: TextField(
        controller: _namaPoliCtrl,
        decoration: const InputDecoration(border: OutlineInputBorder(), labelText: "Nama Poli"),
      ),
    );
  }

  _tombolSimpan() {
    return ElevatedButton(
        onPressed: () {
          Poli poli = Poli(namaPoli: _namaPoliCtrl.text);
          if (widget.poli != null) Navigator.pop(context);
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => PoliDetail(poli: poli)));
          _namaPoliCtrl.clear();
        },
        child: Text(titleButton));
  }
}
