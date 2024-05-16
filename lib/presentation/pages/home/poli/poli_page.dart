import 'package:belajar_flutter/common/utils/generics/bloc_status_util.dart';
import 'package:belajar_flutter/di/injections.dart';
import 'package:belajar_flutter/presentation/bloc/poli/poli_bloc.dart';
import 'package:belajar_flutter/presentation/pages/home/poli/poli_detail.dart';
import 'package:belajar_flutter/presentation/pages/home/poli/poli_form_add_edit.dart';
import 'package:belajar_flutter/presentation/pages/home/sidebar.dart';
import 'package:belajar_flutter/presentation/pages/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/utils/generics/bloc_status.dart';

class PoliPage extends StatefulWidget {
  const PoliPage({super.key});

  @override
  State<StatefulWidget> createState() => PoliPageState();
}

class PoliPageState extends State<PoliPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<PoliBloc>()..add(OnPoliGetList()),
      child: Scaffold(
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
                handleStatus(context, state.status);
                if (state.status.isLoaded() && state.returnOnPoliGetList == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: Colors.red,
                      content: Text("Data Empty"),
                    ),
                  );
                }
              },
              builder: (context, state) {
                if (state.status == Status.loading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return RefreshIndicator(
                    onRefresh: () async {
                      context.read<PoliBloc>().add(OnPoliGetList());
                    },
                    child: GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 3,
                        ),
                        physics: const AlwaysScrollableScrollPhysics(),
                        padding: const EdgeInsets.all(8),
                        itemCount: state.returnOnPoliGetList?.length ?? 0,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => PoliDetail(poli: state.returnOnPoliGetList![index])),
                              ).then((value) {
                                context.read<PoliBloc>().add(OnPoliGetList());
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              child: Card(
                                shadowColor: Colors.blue,
                                elevation: 4,
                                borderOnForeground: true,
                                child: ListTile(
                                  title: Text("Poli ${state.returnOnPoliGetList?[index].namaPoli}"),
                                ),
                              ),
                            ),
                          );
                        }),
                  );
                }
              },
            ),
          )),
    );
  }
}
