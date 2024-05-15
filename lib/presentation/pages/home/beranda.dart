// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:belajar_flutter/common/utils/generics/bloc_status_util.dart';
import 'package:belajar_flutter/di/injections.dart';
import 'package:belajar_flutter/presentation/bloc/poli/poli_bloc.dart';
import 'package:belajar_flutter/presentation/pages/home/poli/poli_page.dart';
import 'package:belajar_flutter/presentation/pages/home/sidebar.dart';
import 'package:belajar_flutter/presentation/pages/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Beranda extends StatefulWidget {
  const Beranda({super.key});

  @override
  State<Beranda> createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<PoliBloc>()..add(OnPoliGetList())),
      ],
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
          return Scaffold(
            drawer: Sidebar(),
            appBar: CustomAppBar(title: "Beranda"),
            body: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const PoliPage())).then((value) {
                        context.read<PoliBloc>().add(OnPoliGetList());
                      });
                    },
                    child: KanzanData(
                      title: "Data Poli",
                      data: "${state.returnOnPoliGetList?.length ?? 0} Poli",
                      icon: Icons.accessible,
                    ),
                  ),
                ),
                Expanded(
                  child: KanzanData(
                    title: "Data Pegawai",
                    data: "0 Pegawai",
                    icon: Icons.people,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class KanzanData extends StatelessWidget {
  final IconData icon;

  const KanzanData({super.key, required this.title, required this.data, required this.icon});

  final String title;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: Colors.blue),
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: Colors.blue,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            Text("$data"),
          ],
        ),
      ),
    );
  }
}
