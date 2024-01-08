import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:office_archiving/constants.dart';
import 'package:office_archiving/cubit/cubit/section_cubit.dart';
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
  late Box<Section> sectionBox;
  @override
  void initState() {
    super.initState();
    sectionBox = Hive.box<Section>(kSectionBox);
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        log('sectionBox:$sectionBox');
        log('sectionBox.length :${sectionBox.length}');
        log('sectionBox.isEmpty :${sectionBox.isEmpty}');

        _showAddSectionDialog(context);
      },
      child: const Icon(Icons.add),
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
