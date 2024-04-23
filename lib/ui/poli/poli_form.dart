import 'package:belajar_1/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';

class PoliForm extends StatefulWidget {
  const PoliForm({super.key});

  @override
  State<StatefulWidget> createState() => PoliFormState();
}

class PoliFormState extends State<PoliForm> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Tambah Poli"),
      body: SingleChildScrollView(
        child: Form(
            key: formKey,
            child: Column(
              children: [
                const TextField(
                  decoration: InputDecoration(labelText: "Nama Poli"),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(onPressed: () {}, child: const Text("Simpan"))
              ],
            )),
      ),
    );
  }
}
