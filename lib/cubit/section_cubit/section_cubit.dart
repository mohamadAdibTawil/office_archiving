import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:office_archiving/constants.dart';
import 'package:office_archiving/models/section.dart';
import 'package:hive/hive.dart';

part 'section_state.dart';

class SectionCubit extends Cubit<SectionState> {
  SectionCubit() : super(SectionInitial());

  final Box<Section> sectionBox = Hive.box<Section>(kSectionBox);
////////////////////////////////////////////////
  void fetchSections() {
    emit(FetchSectionsSuccess(sectionBox.values.toList()));
  }
////////////////////////////////////////////////

  void addSection(String sectionName) {
    final newSection = Section(
        name: sectionName,
        id: (DateTime.now().millisecondsSinceEpoch) % 1000000);
    sectionBox.add(newSection);
    emit(AddSection(newSection));

    fetchSections();
  }
////////////////////////////////////////////////

  void removeSection(Section section) {
    section.delete();
    emit(RemoveSection(section));

    fetchSections();
  }

////////////////////////////////////////////////

  void renameSection(int index, String newName) {
    if (index >= 0 && index < sectionBox.length) {
      final Section? sectionid = Hive.box<Section>(kSectionBox).getAt(index);
      if (sectionid == null) {
        log('null section id: newName: $newName --- ');
        log('null section id: section: $sectionid --- ');
        return;
      }
      sectionid.name = newName;
      sectionid.save();
      fetchSections();
    }
  }

////////////////////////////////////////////////
  ///
  void sectionsSelection(List<Section> sections) {
    final List<Section> selectedSections = (state is SectionsSelected)
        ? (state as SectionsSelected).selectedSections
        : [];

    // Check if all sections are already selected
    bool allSelected =
        selectedSections.every((section) => sections.contains(section));

    if (allSelected) {
      // If all are selected, remove all from the selected list
      selectedSections.removeWhere((section) => sections.contains(section));
    } else {
      // If not all are selected, add all to the selected list
      selectedSections.addAll(sections);
    }

    emit(SectionsSelected(List.from(selectedSections)));
  }

////////////////////////////////////////////////

  void startSelection(bool isSelecting) {
    isSelecting = true;
  }

////////////////////////////////////////////////
  void endSelection(bool isSelecting) {
    isSelecting = false;
  }
////////////////////////////////////////////////

////////////////////////////////////////////////
}
