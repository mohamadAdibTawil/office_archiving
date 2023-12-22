import 'package:flutter/material.dart';

class CustomFloatingActionButtonWidgetApp extends StatelessWidget {
  const CustomFloatingActionButtonWidgetApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      child: const Icon(Icons.add),
    );
  }
}
