import 'package:belajar_flutter/di/injections.dart';
import 'package:belajar_flutter/domain/entities/poli.dart';
import 'package:belajar_flutter/presentation/bloc/poli/poli_bloc.dart';
import 'package:belajar_flutter/presentation/pages/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/utils/generics/bloc_status.dart';
import 'poli_detail.dart';

class PoliFormAddEdit extends StatefulWidget {
  const PoliFormAddEdit({super.key, this.poli});

  final Poli? poli;

  @override
  State<StatefulWidget> createState() => PoliFormAddEditState();
}

class PoliFormAddEditState extends State<PoliFormAddEdit> {
  late final formKey = GlobalKey<FormState>();
  late final poliNameCtrl = TextEditingController();

  String poliId = "";
  String titleToolbar = "";
  String titleButton = "";

  var _isPoliNull = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _isPoliNull = widget.poli.isNull();
      poliId = widget.poli?.id ?? "";
      poliNameCtrl.text = widget.poli?.namaPoli ?? "";
    });
  }

  @override
  Widget build(BuildContext context) {
    titleToolbar = _isPoliNull ? "Tambah Poli" : "Ubah Poli";
    titleButton = _isPoliNull ? "Simpan" : "Simpan Perubahan";

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<PoliBloc>()),
      ],
      child: BlocConsumer<PoliBloc, PoliBlocState>(
        listener: (context, state) {
          if (state.status == Status.serverError) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                backgroundColor: Colors.red,
                content: Text("Server Error"),
              ),
            );
          }
          if (state.status == Status.networkError) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                backgroundColor: Colors.red,
                content: Text("Not connected"),
              ),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: CustomAppBar(title: titleToolbar),
            body: SingleChildScrollView(
              child: Form(
                  key: formKey,
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    child: Card(
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [_fieldNamaPoli(), _tombolSimpan(context)],
                        ),
                      ),
                    ),
                  )),
            ),
          );
        },
      ),
    );
  }

  _fieldNamaPoli() {
    return Container(
      margin: const EdgeInsets.all(16),
      child: TextField(
        controller: poliNameCtrl,
        decoration: const InputDecoration(border: OutlineInputBorder(), labelText: "Nama Poli"),
      ),
    );
  }

  _tombolSimpan(BuildContext context) {
    return ElevatedButton(
        onPressed: () async {
          if (_isPoliNull) {
            Poli poli = Poli(namaPoli: poliNameCtrl.text);
            context.read<PoliBloc>().add(OnPoliSave(poli: poli));
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => PoliDetail(poli: poli)));
            poliNameCtrl.clear();
          } else {
            var poli = Poli(id: poliId, namaPoli: poliNameCtrl.text);
            context.read<PoliBloc>().add(OnPoliEdit(poli: poli));
            Navigator.pop(context);
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => PoliDetail(poli: poli)));
            poliNameCtrl.clear();
          }
        },
        child: Text(titleButton));
  }
}