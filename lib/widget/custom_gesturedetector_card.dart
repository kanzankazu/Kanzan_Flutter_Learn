import 'package:flutter/material.dart';

class CustomCardGestureDetector extends StatefulWidget {
  const CustomCardGestureDetector({super.key, required this.title, required this.onTap});

  final String title;
  final Function() onTap;

  @override
  State<StatefulWidget> createState() => CustomCardGestureDetectorState();
}

class CustomCardGestureDetectorState extends State<CustomCardGestureDetector> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Card(
        child: ListTile(
          title: Text(widget.title),
        ),
      ),
    );
  }
}
