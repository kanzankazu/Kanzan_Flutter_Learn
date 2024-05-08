import 'package:belajar_flutter/ui/beranda.dart';
import 'package:belajar_flutter/ui/login.dart';
import 'package:belajar_flutter/ui/pasien/pasien_page.dart';
import 'package:belajar_flutter/ui/pegawai/pegawai_page.dart';
import 'package:belajar_flutter/ui/poli/poli_page.dart';
import 'package:flutter/material.dart';

import '../helper/login_service.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
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
            onTap: () async {
              await LoginService().logout().then((value) => {
                    if (value)
                      {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => const Login()),
                          (Route<dynamic> route) => false,
                        )
                      }
                  });
            },
          )
        ],
      ),
    );
  }
}
