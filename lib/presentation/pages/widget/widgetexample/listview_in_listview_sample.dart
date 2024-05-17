import 'package:belajar_flutter/presentation/pages/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';

class ListviewInListviewSample extends StatelessWidget {
  const ListviewInListviewSample({super.key});

  @override
  Widget build(BuildContext context) {
    final kanzan = Container(
      margin: const EdgeInsets.all(5),
      height: 50,
      color: Colors.blue,
      child: const Center(child: Text("kanzan")),
    );
    final kazu = Container(
      margin: const EdgeInsets.all(5),
      height: 50,
      color: Colors.blue[50],
      child: const Center(child: Text("kazu")),
    );

    return Scaffold(
      appBar: const CustomAppBar(title: "Listview In Listview"),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            ListView(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: [
                kanzan,
                kanzan,
                kanzan,
                kanzan,
                kanzan,
                kanzan,
                kanzan,
                kanzan,
                kanzan,
                kanzan,
              ],
            ),
            ListView(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: [
                kazu,
                kazu,
                kazu,
                kazu,
                kazu,
                kazu,
                kazu,
                kazu,
                kazu,
                kazu,
              ],
            )
          ]),
        ),
      ),
    );
  }
}
