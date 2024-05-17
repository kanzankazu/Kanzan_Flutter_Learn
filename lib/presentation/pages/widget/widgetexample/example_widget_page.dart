// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:belajar_flutter/presentation/pages/widget/custom_app_bar.dart';
import 'package:belajar_flutter/presentation/pages/widget/widgetexample/bottom_nav_fab_sample.dart';
import 'package:belajar_flutter/presentation/pages/widget/widgetexample/bottom_nav_page_sample.dart';
import 'package:belajar_flutter/presentation/pages/widget/widgetexample/column_sample.dart';
import 'package:belajar_flutter/presentation/pages/widget/widgetexample/hello_world.dart';
import 'package:belajar_flutter/presentation/pages/widget/widgetexample/hello_world_stateful.dart';
import 'package:belajar_flutter/presentation/pages/widget/widgetexample/listview_in_listview_sample.dart';
import 'package:belajar_flutter/presentation/pages/widget/widgetexample/map_sample.dart';
import 'package:belajar_flutter/presentation/pages/widget/widgetexample/map_sample_2.dart';
import 'package:belajar_flutter/presentation/pages/widget/widgetexample/row_column_grid_sample.dart';
import 'package:belajar_flutter/presentation/pages/widget/widgetexample/row_column_sample.dart';
import 'package:belajar_flutter/presentation/pages/widget/widgetexample/row_sample.dart';
import 'package:belajar_flutter/presentation/pages/widget/widgetexample/stepper_sample.dart';
import 'package:flutter/material.dart';

class ExampleWidgetPage extends StatelessWidget {
  const ExampleWidgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Example Widget Page"),
      body: ListView(
        padding: EdgeInsets.all(8),
        children: [
          exampleWidgetPageItem(context, "Hello World", builder: (context) => HelloWorld()),
          exampleWidgetPageItem(context, "Hello World StateFul", builder: (context) => HelloWorldStateFul(message: "Hello World StateFul")),
          exampleWidgetPageItem(context, "Column Widget", builder: (context) => ColumnSample()),
          exampleWidgetPageItem(context, "Row Widget", builder: (context) => RowSample()),
          exampleWidgetPageItem(context, "Baris Kolom", builder: (context) => RowColumnSample()),
          exampleWidgetPageItem(context, "Row Column Grid", builder: (context) => RowColumnGridSample()),
          exampleWidgetPageItem(context, "Map Sample", builder: (context) => MapSample()),
          exampleWidgetPageItem(context, "Map Sample 2", builder: (context) => MapSample2()),
          exampleWidgetPageItem(context, "Listview In Listview", builder: (context) => ListviewInListviewSample()),
          exampleWidgetPageItem(context, "Stepper", builder: (context) => StepperSample()),
          exampleWidgetPageItem(context, "Bottom Nav Sample", builder: (context) => BottomNavFABSample()),
          exampleWidgetPageItem(context, "Bottom Nav Page Sample",
              builder: (context) => BottomNavPageSample(
                    title: "Bottom Nav Page Sample",
                    key: null,
                  )),
        ],
      ),
    );
  }

  exampleWidgetPageItem(BuildContext context, String title, {required WidgetBuilder builder}) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: builder)),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Container(
            decoration: BoxDecoration(
              border: Border.all(width: 1),
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            child: Center(
              child: Text(title),
            )),
      ),
    );
  }
}
