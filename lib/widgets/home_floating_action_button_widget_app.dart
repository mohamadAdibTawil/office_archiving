import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:office_archiving/constants.dart';
import 'package:office_archiving/cubit/section_cubit/section_cubit.dart';
import 'package:office_archiving/models/section.dart';
import 'package:office_archiving/widgets/add_section_dialog.dart';

class HomeFloatingActionButtonWidgetApp extends StatefulWidget {
  final SectionCubit sectionCubit;
  const HomeFloatingActionButtonWidgetApp({
    super.key,
    required this.sectionCubit,
  });

  @override
  State<HomeFloatingActionButtonWidgetApp> createState() =>
      _HomeFloatingActionButtonWidgetAppState();
}

class _HomeFloatingActionButtonWidgetAppState
    extends State<HomeFloatingActionButtonWidgetApp> {
  // late Box<Section> sectionBox;
  @override
  void initState() {
    super.initState();
    // sectionBox = Hive.box<Section>(kSectionBox);
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
      
        _showAddSectionDialog(context);
      },
      child: const Icon(Icons.my_library_add_rounded),
    );
  }

  void _showAddSectionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AddSectionDialog(
          sectionCubit: widget.sectionCubit,
        );
      },
    );
  }
}
