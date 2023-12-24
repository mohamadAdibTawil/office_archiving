import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:office_archiving/constants.dart';
import 'package:office_archiving/models/section.dart';

class CustomFloatingActionButtonWidgetApp extends StatefulWidget {
  const CustomFloatingActionButtonWidgetApp({
    super.key,
  });

  @override
  State<CustomFloatingActionButtonWidgetApp> createState() =>
      _CustomFloatingActionButtonWidgetAppState();
}

class _CustomFloatingActionButtonWidgetAppState
    extends State<CustomFloatingActionButtonWidgetApp> {
  late Box<Section> sectionBox;
  @override
  void initState() {
    super.initState();
          sectionBox = Hive.box<Section>(kSectionBox);

    // _loadSections();
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
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
          onAddSection: (sectionName) {
            if (sectionName.isNotEmpty) {
              setState(() {
                sectionBox
                    .add(Section(name: sectionName, id: sectionName.hashCode));
              });
            }
          },
        );
      },
    );
  }
}

class AddSectionDialog extends StatefulWidget {
  final Function(String) onAddSection;

  const AddSectionDialog({super.key, required this.onAddSection});

  @override
  State<AddSectionDialog> createState() => _AddSectionDialogState();
}

class _AddSectionDialogState extends State<AddSectionDialog> {
  final TextEditingController _sectionNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  if (_sectionNameController.text.isNotEmpty) {
                    widget.onAddSection(_sectionNameController.text);
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
  }
}
