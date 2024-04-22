import 'package:belajar_1/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';

class PoliPage extends StatefulWidget {
  const PoliPage({super.key});

  @override
  State<StatefulWidget> createState() => _PoliPage();
}

class _PoliPage extends State<PoliPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        titleAppBar: "Data Poli",
      ),
      body: ListView(
        children: const [
          Card(
            child: ListTile(
              title: Text("Poli Anak"),
            ),
          ),
          Card(
            child: ListTile(
              title: Text("Poli Kandungan"),
            ),
          ),
          Card(
            child: ListTile(
              title: Text("Poli Gigi"),
            ),
          ),
          Card(
            child: ListTile(
              title: Text("Poli THT"),
            ),
          ),
        ],
      ),
    );
  }
}
