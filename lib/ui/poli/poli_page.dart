import 'package:belajar_1/model/poli.dart';
import 'package:belajar_1/ui/poli/poli_form_add_edit.dart';
import 'package:belajar_1/ui/poli/poli_item.dart';
import 'package:belajar_1/ui/sidebar.dart';
import 'package:belajar_1/widget/custom_app_bar.dart';
import 'package:belajar_1/widget/custom_stream_builder.dart';
import 'package:flutter/material.dart';

import '../../helper/poli_service.dart';

class PoliPage extends StatefulWidget {
  const PoliPage({super.key});

  @override
  State<StatefulWidget> createState() => PoliPageState();
}

class PoliPageState extends State<PoliPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Sidebar(),
      appBar: CustomAppBar(title: "Data Poli", actions: [
        GestureDetector(
          child: const Icon(Icons.add),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PoliFormAddEdit()),
            );
          },
        )
      ]),
        body: CustomStreamBuilder(
          stream: getList(),
          onSuccessWidget: (data) {
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(8),
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return PoliItem(poli: data[index]);
                });
          },
        ));
  }

  Stream<List<Poli>> getList() async* {
    List<Poli> data = await PoliService().getList();
    yield data;
  }
}
