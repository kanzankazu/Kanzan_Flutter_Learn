import 'package:belajar_1/di/injections.dart';
import 'package:belajar_1/presentation/bloc/item/item_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ItemBloc>(),
      child: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: BlocBuilder<ItemBloc, ItemBlocState>(builder: (context, state) {
            if (state.data != null) {
              return Text("Current Item : ${state.data?.name}");
            } else {
              return const Text("Page not found");
            }
          }),
        ),
      ),
    );
  }
}
