// add_item_dialog.dart
import 'dart:io';
import 'dart:convert';
import 'package:file_picker/file_picker.dart';
import 'package:path/path.dart' as path;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../models/item.dart';

class AddItemDialog extends StatelessWidget {
  final Function(ItemSection) onAddItem;
  final BuildContext context;

  const AddItemDialog({
    Key? key,
    required this.onAddItem,
    required this.context,
  }) : super(key: key);

  Future<void> _takePhoto() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      final file = File(pickedFile.path);
      _addItem(ItemSection(
        itemName: 'image ${DateTime.now().millisecond}',
        filePath: file.path,
        fileType: _getFileType(file.path),
      ));
    }
  }

  Future<void> _chooseFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: [
          'pdf',
          'doc',
          'docx',
          'xlsx',
          'txt',
          'jpg',
          'png',
          'jpeg',
        ],
      );

      if (result != null) {
        PlatformFile file = result.files.first;
        final pickedFile = File(file.path!);

        _addItem(ItemSection(
          itemName: path.basename(pickedFile.path),
          filePath: pickedFile.path,
          fileType: _getFileType(pickedFile.path),
        ));
      }
    } catch (e) {
      print('Error picking file: $e');
    }
  }

  String _getFileType(String filePath) {
    String fileExtension = path.extension(filePath);
    String fileType = 'unknown';

    if (fileExtension.isNotEmpty) {
      fileExtension = fileExtension.toLowerCase();

      switch (fileExtension) {
        case '.pdf':
          fileType = 'pdf';
          break;
        case '.doc':
        case '.docx':
          fileType = 'word';
          break;
        case '.xlsx':
          fileType = 'excel';
          break;
        case '.txt':
          fileType = 'txt';
          break;
        case '.jpg':
        case '.jpeg':
        case '.png':
          fileType = 'image';
          break;
      }
    }

    return fileType;
  }

  void _addItem(ItemSection item) {
    item.fileType = _getFileType(item.filePath!);
    onAddItem(item);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Item'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ElevatedButton(
            onPressed: _takePhoto,
            child: const Text('Take Photo'),
          ),
          ElevatedButton(
            onPressed: _chooseFile,
            child: const Text('Choose File'),
          ),
        ],
      ),
    );
  }
}
