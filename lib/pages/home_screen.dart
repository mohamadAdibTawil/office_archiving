import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:office_archiving/constants.dart';
import 'package:office_archiving/cubit/section_cubit/section_cubit.dart';
import 'package:office_archiving/models/section.dart';
import 'package:office_archiving/pages/section_screen.dart';
import 'package:office_archiving/widgets/custom_appbar_widget_app.dart';
import 'package:office_archiving/widgets/home_floating_action_button_widget_app.dart';
import 'package:office_archiving/widgets/custom_grid_widget_app.dart';
import 'package:office_archiving/widgets/rename_section_dailog.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Section> sections = [];
  bool isSelecting = false;
  List<int> selectedIndices = [];
  late SectionCubit sectionCubit;
  List<int> selectedItems = [];
  @override
  void initState() {
    sectionCubit = context.read<SectionCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: CustomAppBarWidgetApp(
          sectionCubit: sectionCubit,
        ),
        floatingActionButton: HomeFloatingActionButtonWidgetApp(
          sectionCubit: sectionCubit,
        ),
        body: BlocBuilder<SectionCubit, SectionState>(
          builder: (context, state) {
            if (state is SectionInitial) {
              log('SectionInitial: $state');
              sectionCubit.fetchSections();
              return const Center(child: CircularProgressIndicator());
            } else if (state is FetchSectionsSuccess) {
              log('FetchSectionsSuccess: $state');
              // sections.addAll(state.sections);

              return SafeArea(
                child: GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: state.sections.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  SectionScreen(section: state.sections[index]),
                            ));
                      },
                      onLongPress: () {
                        _showOptionsDialog(context, state.sections[index]);
                      },
                      child: Card(
                        elevation: 12.2,
                        color: isSelecting ? Colors.blue : kWhiteColor,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 10),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              state.sections[index].name,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              maxLines: 5,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            } else {
              log('else  $state');
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }

  void _showOptionsDialog(BuildContext context, Section section) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Options for ${section.name}'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Handle rename logic
                _handleRenameSection(section);
              },
              child: const Text('Rename'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Handle delete logic
                _handleDeleteSection(section);
              },
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  void _handleRenameSection(Section section) async {
    String? newName = await showDialog<String>(
      context: context,
      builder: (context) => RenameSectionDialog(currentName: section.name),
    );

    if (newName != null) {
      final int sectionIndex = Hive.box<Section>(kSectionBox)
          .values
          .toList()
          .indexWhere((s) => s.id == section.id);
      if (sectionIndex != -1) {
        sectionCubit.renameSection(sectionIndex, newName);
      }
    }
  }

  void _handleDeleteSection(Section section) {
    sectionCubit.removeSection(section);
  }
}
