import 'package:flutter/material.dart';
import 'package:office_archiving/widgets/custom_appbar_widget_app.dart';
import 'package:office_archiving/widgets/home_floating_action_button_widget_app.dart';
import 'package:office_archiving/widgets/custom_grid_widget_app.dart';
import 'package:office_archiving/models/section.dart';

class SectionScreen extends StatelessWidget {
  const SectionScreen({super.key, required this.section});
  final Section section;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          appBar: AppBar(
            title: Text(section.name),
            centerTitle: true,
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.add_to_photos_rounded),
          ),
          body: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (context, index) {
              return null;
            },
          )),
    );
  }
}
