import 'package:flutter/material.dart';
import 'package:office_archiving/pages/section_screen.dart';

Future<dynamic> navigateToSectionScreen(BuildContext context) {
  return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SectionScreen(),
      ));
}
