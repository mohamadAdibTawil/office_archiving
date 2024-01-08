// import 'package:flutter/material.dart';
// import 'package:office_archiving/models/section.dart';
// import 'package:office_archiving/widgets/section_grid_item_body.dart';
// import 'package:office_archiving/constants.dart';
// class CustomGridWidgetApp extends StatefulWidget {
//   final List<Section> sections;
//   final Function(int) onSectionTap;
//   final Function(int) onSectionLongPress;
//   final List<int> selectedIndices;
//   final bool isSelected;

//   const CustomGridWidgetApp({
//     super.key,
//     required this.sections,
//     required this.onSectionTap,
//     required this.onSectionLongPress,
//     required this.selectedIndices,
//     required this.isSelected,
//   });

//   @override
//   State<CustomGridWidgetApp> createState() => _CustomGridWidgetAppState();
// }

// class _CustomGridWidgetAppState extends State<CustomGridWidgetApp> {
//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//       padding: const EdgeInsets.symmetric(horizontal: 4),
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2,
//       ),
//       itemCount: widget.sections.length,
//       itemBuilder: (context, index) {
//         return GestureDetector(
//       onTap: () => widget.onSectionTap(index),
//       onLongPress: () => widget.onSectionLongPress(index),
//       child: Card(
//         elevation: 12.2,
//         color: widget.isSelected ? Colors.blue : kWhiteColor,
//         margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
//         child: Center(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 10),
//             child: Text(
//               widget.section.name,
//               overflow: TextOverflow.ellipsis,
//               textAlign: TextAlign.center,
//               maxLines: 5,
//               style: const TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );


        
      
//       },
//     );
//   }
// }
//   //  SectionGridItemBody(
//         //   section: widget.sections[index],
//         //   isSelected: widget.isSelected,
//         //   index: index,
//         //   onSectionTap: (index) {
//         //     widget.onSectionTap(index);
//         //   },
//         //   onSectionLongPress: (index) {
//         //     widget.onSectionLongPress(index);
//         //   },
//         // );