import 'package:belajar_1/core/utils/generics/bloc_status.dart';
import 'package:belajar_1/di/injections.dart';
import 'package:belajar_1/presentation/bloc/login/login_logout_bloc.dart';
import 'package:belajar_1/presentation/pages/home/beranda.dart';
import 'package:belajar_1/presentation/pages/login/pages/login.dart';
import 'package:belajar_1/presentation/pages/pasien/pasien_page.dart';
import 'package:belajar_1/presentation/pages/pegawai/pegawai_page.dart';
import 'package:belajar_1/presentation/pages/poli/poli_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<LoginLogoutBloc>()),
      ],
      child: Drawer(
        child: BlocConsumer<LoginLogoutBloc, LoginLogoutBlocState>(
          listener: (context, state) {
            if (state.status == Status.loaded) {
              if (state.returnLogout == true) {
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const Login()), (Route<dynamic> route) => false);
              }
            }
          },
          builder: (context, state) {
            return ListView(
              padding: EdgeInsets.zero,
              children: [
                const UserAccountsDrawerHeader(accountName: Text("Admin"), accountEmail: Text("admin@admin.com")),
                ListTile(
                  leading: const Icon(Icons.home),
                  title: const Text("Beranda"),
                  onTap: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Beranda()));
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.accessible),
                  title: const Text("Poli"),
                  onTap: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const PoliPage()));
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.people),
                  title: const Text("Pegawai"),
                  onTap: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const PegawaiPage()));
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.account_box_sharp),
                  title: const Text("Pasien"),
                  onTap: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const PasienPage()));
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.logout_rounded),
                  title: const Text("Keluar"),
                  onTap: () {
                    context.read<LoginLogoutBloc>().add(OnLogout());
                  },
                )
              ],
            );
          },
        ),
      ),
    ); //
  }
}
