import 'package:belajar_flutter/presentation/pages/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';

class RowColumnSample extends StatelessWidget {
  const RowColumnSample({super.key});

  final int baris = 3;
  final int totalData = 9;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Baris Kolom"),
      body: GridView.count(
        crossAxisCount: baris,
        children: List.generate(totalData, (index) {
          int row = index ~/ baris; // Mendapatkan baris dari indeks
          int column = index % baris; // Mendapatkan kolom dari indeks
          return Center(
            child: Text(
              'Baris ${row + 1} Kolom ${column + 1}',
              style: const TextStyle(fontSize: 20),
            ),
          );
        }),
      ),
    );
  }
}
