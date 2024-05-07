import 'package:flutter/material.dart';

class CustomStreamBuilder<T> extends StatefulWidget {
  const CustomStreamBuilder({super.key, required this.stream, required this.onSuccessWidget});

  final Stream<T> stream;
  final Widget Function(T) onSuccessWidget;

  @override
  State<StatefulWidget> createState() => CustomStreamBuilderState<T>();
}

class CustomStreamBuilderState<T> extends State<CustomStreamBuilder<T>> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<T>(
      stream: widget.stream,
      builder: (context, AsyncSnapshot<T> snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text(snapshot.error.toString(), style: const TextStyle(fontWeight: FontWeight.bold)),
          );
        }
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (!snapshot.hasData && snapshot.connectionState == ConnectionState.done) {
          return const Center(child: Text("Data Kosong", style: TextStyle(fontWeight: FontWeight.bold)));
        }
        if (snapshot.data == null && snapshot.connectionState == ConnectionState.done) {
          return const Center(child: Text("Data Kosong", style: TextStyle(fontWeight: FontWeight.bold)));
        }
        return widget.onSuccessWidget(snapshot.data as T);
      },
    );
  }
}
