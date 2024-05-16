import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.title, this.actions
      /*required this.onTextChanged*/
      });

  final String title;
  final List<Widget>? actions;

  //final Function(String) onTextChanged;

  @override
  State<StatefulWidget> createState() => _CustomAppBar();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomAppBar extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blue,
      title: Text(
        widget.title,
        style: const TextStyle(color: Colors.white),
      ),
      actions: widget.actions,
    );
  }
}
