import 'package:flutter/material.dart';
import 'package:office_archiving/cubit/section_cubit/section_cubit.dart';

class AddSectionDialog extends StatefulWidget {
  final SectionCubit sectionCubit;
  const AddSectionDialog({
    super.key,
    required this.sectionCubit,
  });

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
                child:
                    const Text('Cancel', style: TextStyle(color: Colors.red)),
              ),
              ElevatedButton(
                onPressed: () {
                  if (_sectionNameController.text.isNotEmpty) {

                    setState(() {
                      widget.sectionCubit
                          .addSection(_sectionNameController.text);
                    });
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
