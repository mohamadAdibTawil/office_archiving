
import 'package:flutter/material.dart';
import 'package:office_archiving/constants.dart';

class CostomAppBarWidgetApp extends StatelessWidget {
  const CostomAppBarWidgetApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SliverAppBar(
      title: Text(officeArchiving),
      // actions: [],
      centerTitle: true,
    );
  }
}
