import 'package:flutter/material.dart';
import 'package:office_archiving/widgets/costom_appbar_widget_app.dart';
import 'package:office_archiving/widgets/costom_floating_action_button_widget_app.dart';
import 'package:office_archiving/widgets/costom_grid_widget_app.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      floatingActionButton: CostomFloatingActionButtonWidgetApp(),
      body: CustomScrollView(slivers: [
        CostomAppBarWidgetApp(),
        CostomGridWidgetApp(),
      ]),
    );
  }
}
