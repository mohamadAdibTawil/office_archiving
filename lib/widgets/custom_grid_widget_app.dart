import 'package:flutter/material.dart';
import 'package:office_archiving/constants.dart';

class CustomGridWidgetApp extends StatelessWidget {
  final void Function()? onTap;
  final Widget? child;
  const CustomGridWidgetApp({
    super.key,
    this.onTap, this.child,
  });
  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return GestureDetector(
            onTap: onTap,
            child: child,
          );
        },
      ),
    );
  }
}
