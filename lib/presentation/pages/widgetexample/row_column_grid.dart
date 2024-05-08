import 'package:flutter/material.dart';

class RowColumnGrid extends StatelessWidget {
  const RowColumnGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Container(
                      width: 200,
                      color: Colors.grey,
                    ),
                    Container(
                      width: 200,
                      color: Colors.blueGrey,
                    ),
                    Container(
                      width: 200,
                      color: Colors.green,
                    ),
                    Container(
                      width: 200,
                      color: Colors.grey,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 200,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: <Widget>[
                    Container(
                      width: 50,
                      height: 100,
                      color: Colors.yellowAccent,
                    ),
                    Container(
                      width: 50,
                      height: 100,
                      color: Colors.blue,
                    ),
                    Container(
                      width: 50,
                      height: 100,
                      color: Colors.green,
                    ),
                    Container(
                      width: 50,
                      height: 100,
                      color: Colors.red,
                    ),
                    Container(
                      width: 50,
                      height: 100,
                      color: Colors.yellowAccent,
                    ),
                    Container(
                      width: 50,
                      height: 100,
                      color: Colors.blue,
                    ),
                    Container(
                      width: 50,
                      height: 100,
                      color: Colors.green,
                    ),
                    Container(
                      width: 50,
                      height: 100,
                      color: Colors.red,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 200,
                child: GridView.count(
                  scrollDirection: Axis.horizontal,
                  crossAxisCount: 2,
                  children: List.generate(50, (index) {
                    return const Card(
                      color: Colors.amber,
                    );
                  }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
