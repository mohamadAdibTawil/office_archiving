// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:office_archiving/constants.dart';
// import 'package:office_archiving/models/section.dart';

// class SectionGridItemBody extends StatefulWidget {
//   const SectionGridItemBody({
//     super.key,
//     required this.section,
//     required this.isSelected,
//     required this.index,
//     required this.onSectionTap,
//     required this.onSectionLongPress,
//   });
//   final Section section;
//   final bool isSelected;
//   final int index;
//   final Function(int) onSectionTap;
//   final Function(int) onSectionLongPress;
//   @override
//   State<SectionGridItemBody> createState() => _SectionGridItemBodyState();
// }

// class _SectionGridItemBodyState extends State<SectionGridItemBody> {
//   @override
//   Widget build(BuildContext context) {
//     int index = widget.index;
//     log(index.toString());
//     return GestureDetector(
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
//   }
// }
