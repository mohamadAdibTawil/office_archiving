
import 'package:flutter/material.dart';
import 'package:office_archiving/constants.dart';

class SectionGridITemBody extends StatelessWidget {
  const SectionGridITemBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Card(
      margin: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            testText,
            overflow: TextOverflow.ellipsis,
            maxLines: 5,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
