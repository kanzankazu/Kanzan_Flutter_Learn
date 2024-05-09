import 'package:belajar_flutter/core/utils/generics/bloc_status.dart';
import 'package:belajar_flutter/domain/entities/poli.dart';
import 'package:belajar_flutter/presentation/bloc/poli/poli_bloc.dart';
import 'package:belajar_flutter/presentation/pages/poli/poli_form_add_edit.dart';
import 'package:belajar_flutter/presentation/pages/poli/poli_page.dart';
import 'package:belajar_flutter/presentation/pages/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      body: BlocConsumer<PoliBloc, PoliBlocState>(
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
                content: Text("Not connected "),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state.status == Status.empty) {
            return const Center(child: Text("Empty"));
          } else if (state.status == Status.loading) {
            return const Center(child: Text("Loading ..."));
          } else {
            return poliDetailContain(state.data!);
          }
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
              builder: (contextDialog) => AlertDialog(
                    content: const Text("Yakin ingin menghapus data ini?"),
                    actions: [
                      ElevatedButton(
                        onPressed: () async {
                          context.read<PoliBloc>().add(OnPoliDelete(poli: poli));
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const PoliPage()));
                        },
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                        child: const Text("YA", style: TextStyle(color: Colors.black, decorationColor: Colors.green, decorationStyle: TextDecorationStyle.wavy)),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(contextDialog);
                        },
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                        child: const Text("Tidak", style: TextStyle(color: Colors.black, decorationColor: Colors.green, decorationStyle: TextDecorationStyle.wavy)),
                      )
                    ],
                  ));
        },
        style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
        child: const Text("Hapus", style: TextStyle(color: Colors.black, decorationColor: Colors.green, decorationStyle: TextDecorationStyle.wavy)));
  }
}
