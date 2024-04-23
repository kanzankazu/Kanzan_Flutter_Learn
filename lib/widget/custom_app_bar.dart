import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key, required this.title, this.actions
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
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: Text(widget.title),
      actions: widget.actions,
      /*IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            // Memanggil fungsi onTextChanged dan meneruskan teks yang diinputkan
            widget.onTextChanged(_controller.text);
          },
        ),*/
      /*bottom: PreferredSize(
        preferredSize: const Size.fromHeight(48),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: _controller,
            decoration: const InputDecoration(
              hintText: 'Cari...',
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ),*/
    );
  }
}
