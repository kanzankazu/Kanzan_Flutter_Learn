import 'package:belajar_flutter/presentation/pages/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';

class ColumnSample extends StatelessWidget {
  const ColumnSample({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: "Column Widget"),
      body: Center(
        child: Column(
          children: [
            Text("Kolom 1"),
            Text("Kolom 2"),
            Text("Kolom 3"),
            Text("Kolom 4"),
          ],
        ),
      ),
    );
  }
}
