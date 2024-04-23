import 'package:belajar_1/model/poli.dart';
import 'package:belajar_1/ui/poli/poli_form_add_edit.dart';
import 'package:belajar_1/ui/poli/poli_item.dart';
import 'package:belajar_1/ui/sidebar.dart';
import 'package:belajar_1/widget/custom_app_bar.dart';
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
      appBar: CustomAppBar(
        title: "Data Poli",
        actions: [
          GestureDetector(
            child: const Icon(Icons.add),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const PoliFormAddEdit()));
            },
          )
        ],
      ),
      body: StreamBuilder(
        stream: getList(),
        builder: (context, AsyncSnapshot<List<Poli>> snapshot) {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (!snapshot.hasData && snapshot.connectionState == ConnectionState.done) {
            return const Center(
                child: Text(
              "Data Kosong",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ));
          }
          return ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(8),
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                return PoliItem(poli: snapshot.data![index]);
              });
        },
      ),
    );
  }

  Stream<List<Poli>> getList() async* {
    List<Poli> data = await PoliService().listData();
    yield data;
  }
}
