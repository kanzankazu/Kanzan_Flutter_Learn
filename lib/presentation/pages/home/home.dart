// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:belajar_flutter/common/utils/generics/bloc_status.dart';
import 'package:belajar_flutter/common/utils/generics/bloc_status_util.dart';
import 'package:belajar_flutter/di/injections.dart';
import 'package:belajar_flutter/presentation/bloc/poli/poli_bloc.dart';
import 'package:belajar_flutter/presentation/pages/home/pegawai/pegawai_page.dart';
import 'package:belajar_flutter/presentation/pages/home/poli/poli_page.dart';
import 'package:belajar_flutter/presentation/pages/home/sidebar.dart';
import 'package:belajar_flutter/presentation/pages/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<PoliBloc>()..add(OnPoliGetList())),
      ],
      child: Scaffold(
        drawer: Sidebar(),
        appBar: CustomAppBar(title: "Beranda"),
        body: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: BlocConsumer<PoliBloc, PoliBlocState>(
                listener: (context, state) {
                  handleStatus(context, state.status);
                },
                builder: (context, state) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const PoliPage())).then((value) {
                        context.read<PoliBloc>().add(OnPoliGetList());
                      });
                    },
                    child: BerandaItem(
                      title: "Data Poli",
                      data: "${state.returnOnPoliGetList?.length ?? 0} Poli",
                      icon: Icons.accessible,
                      isLoading: state.status == Status.loading,
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const PegawaiPage())).then((value) {
                    context.read<PoliBloc>().add(OnPoliGetList());
                  });
                },
                child: BerandaItem(
                  title: "Data Pegawai",
                  data: "0 Pegawai",
                  icon: Icons.people,
                  isLoading: false,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BerandaItem extends StatelessWidget {
  final String title;
  final String data;
  final IconData icon;
  final bool isLoading;

  const BerandaItem({super.key, required this.title, required this.data, required this.icon, required this.isLoading});

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
                Icon(icon, color: Colors.blue),
                SizedBox(width: 8),
                Text(title, style: TextStyle(color: Colors.blue, fontSize: 20)),
              ],
            ),
            Text(data)
          ],
        ),
      ),
    );
  }
}
