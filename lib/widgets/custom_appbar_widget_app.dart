import 'package:flutter/material.dart';
import 'package:office_archiving/constants.dart';

class CustomAppBarWidgetApp extends StatelessWidget {
  const CustomAppBarWidgetApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SliverAppBar(
      title: Text(officeArchiving),
      // actions: [],
      centerTitle: true,
      floating: true,
      snap: true,
    );
  }
}
