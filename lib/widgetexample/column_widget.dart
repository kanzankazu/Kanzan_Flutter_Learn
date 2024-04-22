import 'package:flutter/material.dart';

class ColumnWidget extends StatelessWidget {
  const ColumnWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Widget Column"),
      ),
      body: const Center(
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
