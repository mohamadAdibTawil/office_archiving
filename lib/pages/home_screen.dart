import 'package:flutter/material.dart';
import 'package:office_archiving/functions/navigator.dart';
import 'package:office_archiving/pages/section_screen.dart';
import 'package:office_archiving/widgets/custom_appbar_widget_app.dart';
import 'package:office_archiving/widgets/custom_floating_action_button_widget_app.dart';
import 'package:office_archiving/widgets/custom_grid_widget_app.dart';
import 'package:office_archiving/widgets/section_grid_iTem_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const CustomFloatingActionButtonWidgetApp(),
      body: CustomScrollView(slivers: [
        const CustomAppBarWidgetApp(),
        CustomGridWidgetApp(
            onTap: () {
              navigateToSectionScreen(context);
            },
            child: const SectionGridITemBody()),
      ]),
    );
  }
}
