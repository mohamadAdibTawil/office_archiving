import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:office_archiving/constants.dart';
import 'package:office_archiving/cubit/item_section_cubit/item_section_cubit.dart';
import 'package:office_archiving/models/item.dart';
import 'package:office_archiving/widgets/add_item_dialog.dart';
import 'package:office_archiving/widgets/custom_appbar_widget_app.dart';
import 'package:office_archiving/widgets/home_floating_action_button_widget_app.dart';
import 'package:office_archiving/widgets/custom_grid_widget_app.dart';
import 'package:office_archiving/models/section.dart';

// section_screen.dart
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:office_archiving/constants.dart';
import 'package:office_archiving/cubit/item_section_cubit/item_section_cubit.dart';
import 'package:office_archiving/widgets/add_item_dialog.dart';
import 'package:office_archiving/widgets/custom_appbar_widget_app.dart';
import 'package:office_archiving/widgets/home_floating_action_button_widget_app.dart';

import '../cubit/section_cubit/section_cubit.dart';
import '../service/sqlite_service.dart';

class SectionScreen extends StatefulWidget {
  const SectionScreen({super.key, required this.section});
  final Section section;

  @override
  State<SectionScreen> createState() => _SectionScreenState();
}

class _SectionScreenState extends State<SectionScreen> {
  late List<ItemSection> itemSections;
  List<int> selectedIndices = [];
  late ItemSectionCubit itemSectionCubit;
  late SectionCubit sectionCubit;
    late DatabaseProvider databaseProvider;
  @override
  void initState() {
    itemSectionCubit = context.read<ItemSectionCubit>();
    sectionCubit = SectionCubit(databaseProvider);
    sectionCubit.getSections();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.section.name),
          centerTitle: true,
        ),
        body: BlocBuilder<ItemSectionCubit, ItemSectionState>(
          builder: (context, state) {
            if (state is ItemSectionInitial) {
              log('ItemSectionInitial: $state');
              itemSectionCubit.fetchItemsSections();
              return const Center(child: CircularProgressIndicator());
            } else if (state is FetchItemsSectionSuccess) {
              itemSections = state.itemSections; // Initialize itemSections
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemCount: itemSections.length,
                itemBuilder: (context, index) {
                  final ItemSection item = itemSections[index];
                  final bool isSelected = selectedIndices.contains(index);

                  return GestureDetector(
                    onTap: () {
                      _handleItemTap(index);
                    },
                    onLongPress: () {
                      _handleItemLongPress(index);
                    },
                    child: Container(
                      color: isSelected ? Colors.blue : Colors.transparent,
                      child: Center(
                        child: Column(
                          children: [
                            if (item.fileType == 'pdf')
                              const Icon(Icons.picture_as_pdf,
                                  size: 64.0, color: Colors.red),
                            if (item.fileType == 'txt')
                              const Icon(Icons.text_fields,
                                  size: 64.0, color: Colors.blue),
                            if (item.fileType == 'word')
                              const Icon(Icons.description,
                                  size: 64.0, color: Colors.green),
                            const SizedBox(height: 8.0),
                            Text(item.itemName),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _showAddItemDialog(context);
          },
          child: const Icon(Icons.note_add_rounded),
        ),
      ),
    );
  }

  void _showAddItemDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AddItemDialog(
          context: context,
          onAddItem: (item) {
            setState(() {
              widget.section.itemsSection?.add(item);
            });
          },
        );
      },
    );
  }

  void _handleItemTap(int index) {
    setState(() {
      // Handle tap logic
    });
  }

  void _handleItemLongPress(int index) {
    setState(() {
      if (!selectedIndices.contains(index)) {
        selectedIndices.add(index);
      } else {
        selectedIndices.remove(index);
      }
    });
  }
}


// class SectionScreen extends StatefulWidget {
//   const SectionScreen({super.key, required this.section});
//   final Section section;

//   @override
//   State<SectionScreen> createState() => _SectionScreenState();
// }

// class _SectionScreenState extends State<SectionScreen> {
//   late Box<ItemSection> sectionBox;
//   late List<ItemSection> itemSections;
//   List<int> selectedIndices = [];
//   late ItemSectionCubit itemSectionCubit;

//   @override
//   void initState() {
//     sectionBox = Hive.box<ItemSection>(kItemSectionBox);
//     itemSectionCubit = context.read<ItemSectionCubit>();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Directionality(
//       textDirection: TextDirection.rtl,
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text(widget.section.name),
//           centerTitle: true,
//         ),
//         body: BlocBuilder<ItemSectionCubit, ItemSectionState>(
//           builder: (context, state) {
//             if (state is ItemSectionInitial) {
//               log('SectionInitial: $state');
//               itemSectionCubit.fetchItemsSectionSelected(widget.section);
//               return const Center(child: CircularProgressIndicator());
//             } else if (state is FetchItemsSectionSuccess) {
//               itemSections = state.itemSections; // Initialize itemSections
//               return GridView.builder(
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   crossAxisSpacing: 8.0,
//                   mainAxisSpacing: 8.0,
//                 ),
//                 itemCount: itemSections.length,
//                 itemBuilder: (context, index) {
//                   final ItemSection item = itemSections[index];
//                   final bool isSelected = selectedIndices.contains(index);

//                   return GestureDetector(
//                     onTap: () {
//                       _handleItemTap(index);
//                     },
//                     onLongPress: () {
//                       _handleItemLongPress(index);
//                     },
//                     child: Container(
//                       color: isSelected ? Colors.blue : Colors.transparent,
//                       child: Center(
//                         child: Column(
//                           children: [
//                             if (item.fileType == 'pdf')
//                               const Icon(Icons.picture_as_pdf,
//                                   size: 64.0, color: Colors.red),
//                             if (item.fileType == 'txt')
//                               const Icon(Icons.text_fields,
//                                   size: 64.0, color: Colors.blue),
//                             if (item.fileType == 'word')
//                               const Icon(Icons.description,
//                                   size: 64.0, color: Colors.green),
//                             const SizedBox(height: 8.0),
//                             Text(item.itemName),
//                           ],
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               );
//             } else {
//               return const Center(child: CircularProgressIndicator());
//             }
//           },
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () {
//             _showAddItemDialog(context);
//           },
//           child: const Icon(Icons.note_add_rounded),
//         ),
//       ),
//     );
//   }

//   void _showAddItemDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AddItemDialog(
//           context: context,
//           onAddItem: (item) {
//             // Pass the selected section to the cubit
//             itemSectionCubit.addItemToSection(item, widget.section);
//           },
//         );
//       },
//     );
//   }

// //////////////////////////////////////////////////////////////////

// //////////////////////////////////////////////////////////////////

//   void _handleItemTap(int index) {
//     // Handle tap logic if needed
//   }

//   void _handleItemLongPress(int index) {
//     setState(() {
//       if (!selectedIndices.contains(index)) {
//         selectedIndices.add(index);
//       } else {
//         selectedIndices.remove(index);
//       }
//     });
//   }
// }











































 // void _handleDeleteItems() {
  //   for (int index in selectedIndices) {
  //     sectionBox.deleteAt(index);
  //   }
  //   setState(() {
  //     selectedIndices.clear();
  //   });
  // }

  // void _handleRenameItem() {
  //   if (selectedIndices.length == 1) {
  //     int index = selectedIndices.first;
  //     _showRenameItemDialog(index);
  //   }
  // }

  // void _showAddItemDialog() {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: const Text('Add New Item'),
  //         content: const Text('Choose a source for the new item:'),
  //         actions: [
  //           TextButton(
  //             onPressed: () {
  //               _addItemFromCamera();
  //               Navigator.of(context).pop();
  //             },
  //             child: const Text('Take Picture'),
  //           ),
  //           TextButton(
  //             onPressed: () {
  //               _addItemFromGallery();
  //               Navigator.of(context).pop();
  //             },
  //             child: const Text('Choose from Gallery'),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

//   Future<void> _addItemFromCamera() async {
//     final pickedFile =
//         await ImagePicker().pickImage(source: ImageSource.camera);

//     if (pickedFile != null) {
//       final XFile file = XFile(pickedFile.path);
//       final ItemSection newItem = ItemSection(
//         itemName: 'My Item',
// filePath: file.path      );

//       sectionBox.add(newItem);
//       setState(() {
//         itemSectionCubit.fetchItemsSections();
//       });
//     }
//   }

//   Future<void> _addItemFromGallery() async {
//     final pickedFile =
//         await ImagePicker().pickImage(source: ImageSource.gallery);

//     if (pickedFile != null) {
//       final File file = File(pickedFile.path);
//       final ItemSection newItem = ItemSection(
//         itemName: 'My Item',
//       filePath: file.path
//       );

//       sectionBox.add(newItem);
//       setState(() {});
//     }
//   }

//   void _showRenameItemDialog(int index) {
//     ItemSection item = sectionBox.getAt(index)!;
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('Rename Item'),
//           content: TextField(
//             controller: TextEditingController(text: item.itemName),
//             onChanged: (newName) {
//               item.itemName = newName;
//             },
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: const Text('Cancel'),
//             ),
//             TextButton(
//               onPressed: () {
//                 sectionBox.putAt(index, item);
//                 Navigator.of(context).pop();
//               },
//               child: const Text('Rename'),
//             ),
//           ],
//         );
//       },
//     );
//   }