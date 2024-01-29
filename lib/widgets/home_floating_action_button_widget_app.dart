import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:office_archiving/cubit/section_cubit/section_cubit.dart';

import '../models/section.dart';

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
  final TextEditingController _sectionNameController = TextEditingController();

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
        return AlertDialog(
      title: const Text('Add Section'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _sectionNameController,
            decoration: const InputDecoration(labelText: 'Section Name'),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child:
                    const Text('Cancel', style: TextStyle(color: Colors.red)),
              ),
              ElevatedButton(
                onPressed: () {
                  if (_sectionNameController.text.isNotEmpty) {
                    setState(() {
                      widget.sectionCubit.addSection(Section(
                          name: _sectionNameController.text,
                          id: (DateTime.now().millisecondsSinceEpoch) ~/
                              1000000));
                    });
                     log('sqlite ');
                    Navigator.pop(context);
                  }
                },
                child: const Text('Add'),
              ),
            ],
          ),
        ],
      ),
    );
      },
    );
  }
}
