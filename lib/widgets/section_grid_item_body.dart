import 'package:flutter/material.dart';
import 'package:office_archiving/constants.dart';
import 'package:office_archiving/models/section.dart';

class SectionGridITemBody extends StatelessWidget {
  const SectionGridITemBody({
    super.key,
    required this.section,
  });
  final Section section;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            section.name,
            overflow: TextOverflow.ellipsis,
            maxLines: 5,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
