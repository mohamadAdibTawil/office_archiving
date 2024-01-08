import 'package:flutter/material.dart';

class RenameSectionDialog extends StatefulWidget {
  final String currentName;

  const RenameSectionDialog({Key? key, required this.currentName})
      : super(key: key);

  @override
  State<RenameSectionDialog> createState() => _RenameSectionDialogState();
}

class _RenameSectionDialogState extends State<RenameSectionDialog> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.currentName);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Rename Section'),
      content: TextField(
        controller: _controller,
        decoration: const InputDecoration(labelText: 'New Name'),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); 
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            String newName = _controller.text.trim();
            if (newName.isNotEmpty) {
              Navigator.of(context)
                  .pop(newName); // Pass the new name back to the caller
            }
          },
          child: const Text('Rename'),
        ),
      ],
    );
  }
}
