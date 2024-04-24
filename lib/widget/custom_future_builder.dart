import 'package:flutter/material.dart';

class CustomFutureBuilder<T> extends StatefulWidget {
  const CustomFutureBuilder({super.key, required this.future, required this.onSuccessWidget});

  final Future<T> future;
  final Widget Function(T) onSuccessWidget;

  @override
  State<StatefulWidget> createState() => CustomFutureBuilderState<T>();
}

class CustomFutureBuilderState<T> extends State<CustomFutureBuilder<T>> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
      future: widget.future,
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
