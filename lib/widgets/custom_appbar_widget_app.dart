import 'package:flutter/material.dart';
import 'package:office_archiving/constants.dart';
import 'package:office_archiving/cubit/cubit/section_cubit.dart';

class CustomAppBarWidgetApp extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAppBarWidgetApp({
    super.key,
    required this.sectionCubit,
  });
  final SectionCubit sectionCubit;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(officeArchiving),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
