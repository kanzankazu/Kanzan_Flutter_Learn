import 'package:belajar_flutter/core/utils/generics/bloc_status.dart';
import 'package:belajar_flutter/presentation/bloc/poli/poli_bloc.dart';
import 'package:belajar_flutter/presentation/pages/home/sidebar.dart';
import 'package:belajar_flutter/presentation/pages/poli/poli_detail.dart';
import 'package:belajar_flutter/presentation/pages/poli/poli_form_add_edit.dart';
import 'package:belajar_flutter/presentation/pages/poli/poli_item.dart';
import 'package:belajar_flutter/presentation/pages/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
              ).then((value) {
                context.read<PoliBloc>().add(OnPoliGetList());
              });
            },
          )
        ]),
        body: Center(
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
                    content: Text("Not connected "),
                  ),
                );
              }
            },
            builder: (context, state) {
              return RefreshIndicator(
                onRefresh: () async {
                  context.read<PoliBloc>().add(OnPoliGetList());
                },
                child: ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(8),
                    itemCount: state.datas?.length,
                    itemBuilder: (context, index) {
                      return PoliItem(
                        poli: state.datas![index],
                        onTapNew: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => PoliDetail(poli: state.datas![index])),
                          ).then((value) {
                            context.read<PoliBloc>().add(OnPoliGetList());
                          });
                        },
                      );
                    }),
              );
            },
          ),
        ));
  }
}
