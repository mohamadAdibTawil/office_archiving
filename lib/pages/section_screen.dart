import 'package:flutter/material.dart';
import 'package:office_archiving/widgets/custom_appbar_widget_app.dart';
import 'package:office_archiving/widgets/custom_floating_action_button_widget_app.dart';
import 'package:office_archiving/widgets/custom_grid_widget_app.dart';

class SectionScreen extends StatelessWidget {
  const SectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      floatingActionButton: CustomFloatingActionButtonWidgetApp(),
      body: CustomScrollView(slivers: [
        CustomAppBarWidgetApp(),
        CustomGridWidgetApp(child: Card()),
      ]),
    );
  }
}
