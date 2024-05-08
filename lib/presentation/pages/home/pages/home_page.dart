// ignore_for_file: deprecated_member_use

import 'package:belajar_1/core/utils/generics/bloc_status.dart';
import 'package:belajar_1/di/injections.dart';
import 'package:belajar_1/presentation/bloc/item/item_bloc.dart';
import 'package:belajar_1/presentation/routes/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return BlocProvider(
      create: (context) => getIt<ItemBloc>(),
      child: Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child: BlocConsumer<ItemBloc, ItemBlocState>(listener: (context, state) {
            if (state.status == Status.serverError) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  backgroundColor: Colors.red,
                  content: Text("Server Error"),
                ),
              );
            }
            if (state.status == Status.networkError) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  backgroundColor: Colors.red,
                  content: Text("Not connected "),
                ),
              );
            }
          }, builder: (context, state) {
            if (state.status == Status.empty) {
              return const Center(
                child: Text('Empty'),
              );
            } else if (state.status == Status.loading) {
              return const Center(
                child: Text('Loading ...'),
              );
            } else {
              return RefreshIndicator(
                onRefresh: () async {
                  context.read<ItemBloc>().add(ItemOnFinds());
                },
                child: ListView.builder(
                    itemCount: state.datas.length,
                    itemBuilder: (context, int index) {
                      return ListTile(
                          onTap: () {
                            context.read<ItemBloc>().add(
                                  ItemOnFindItemById(id: state.datas[index].id),
                                );
                            Navigator.pushNamed(context, Routes.detail);
                          },
                          leading: CircleAvatar(
                            child: Text("${state.datas[index].id}"),
                          ),
                          title: Text(
                            state.datas[index].name,
                            style: textTheme.bodyText1,
                          ));
                    }),
              );
            }
          }),
        ),
      ),
    );
  }
}
