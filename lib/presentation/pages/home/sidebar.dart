import 'package:belajar_flutter/di/injections.dart';
import 'package:belajar_flutter/presentation/bloc/login/login_logout_bloc.dart';
import 'package:belajar_flutter/presentation/pages/home/home.dart';
import 'package:belajar_flutter/presentation/pages/home/poli/poli_page.dart';
import 'package:belajar_flutter/presentation/pages/login/pages/login.dart';
import 'package:belajar_flutter/presentation/pages/widget/widgetexample/example_widget_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/utils/generics/bloc_status.dart';
import 'pegawai/pegawai_page.dart';

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
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              children: [
                const UserAccountsDrawerHeader(
                  decoration: BoxDecoration(color: Colors.blue),
                  accountName: Text("Admin"),
                  accountEmail: Text("admin@admin.com"),
                ),
                ListTile(
                  leading: const Icon(Icons.home),
                  title: const Text("Beranda"),
                  onTap: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Home()));
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
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const PegawaiPage()));
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.people),
                  title: const Text("Example Widget"),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const ExampleWidgetPage()));
                  },
                ),
                /*ListTile(
                  leading: const Icon(Icons.account_box_sharp),
                  title: const Text("Pasien"),
                  onTap: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const PasienPage()));
                  },
                ),*/
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
