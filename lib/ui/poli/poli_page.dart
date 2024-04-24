import 'dart:async';

import 'package:belajar_1/ui/poli/poli_detail.dart';
import 'package:belajar_1/ui/poli/poli_form_add_edit.dart';
import 'package:belajar_1/ui/poli/poli_item.dart';
import 'package:belajar_1/ui/sidebar.dart';
import 'package:belajar_1/widget/custom_app_bar.dart';
import 'package:belajar_1/widget/custom_future_builder.dart';
import 'package:flutter/material.dart';

import '../../helper/poli_service.dart';
import '../../model/poli.dart';

class PoliPage extends StatefulWidget {
  const PoliPage({super.key});

  @override
  State<StatefulWidget> createState() => PoliPageState();
}

class PoliPageState extends State<PoliPage> {
  late Future<List<Poli>> futureItems;

  Future<List<Poli>> getCollectionItems() async {
    return PoliService().getList();
  }

  Future<void> refreshCollectionItems() async {
    setState(() {
      futureItems = getCollectionItems();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureItems = getCollectionItems();
  }

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
              ).then((value) {
                return refreshCollectionItems();
              });
            },
          )
        ]),
        body: Center(
          child: RefreshIndicator(
            onRefresh: refreshCollectionItems,
            child: CustomFutureBuilder(
              future: futureItems,
              onSuccessWidget: (data) {
                return ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(8),
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return PoliItem(
                        poli: data[index],
                        onTapNew: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => PoliDetail(poli: data[index])),
                          ).then((value) => refreshCollectionItems());
                        },
                      );
                    });
              },
            ),
          ),
        ));
  }
}
