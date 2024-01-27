// import 'dart:developer';

// import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';
// import 'package:office_archiving/constants.dart';
// import 'package:office_archiving/models/section.dart';
// import 'package:hive/hive.dart';

// part 'section_state.dart';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:office_archiving/models/section.dart';
import 'package:sqflite/sqflite.dart';

import '../../service/sqlite_service.dart';

part 'section_state.dart';

class SectionCubit extends Cubit<SectionState> {
  final DatabaseProvider databaseHelper;

  SectionCubit({required this.databaseHelper}) : super(const SectionInitial());

  void fetchSections() async {
    try {
      final sections = await databaseHelper.getSections();
      emit(SectionsLoaded(sections));
    } catch (e) {
      emit(SectionError('Error fetching sections: $e'));
    }
  }

  void addSection(Section section) async {
    try {
      await databaseHelper.insertSection(section);
      fetchSections(); // Reload sections after adding a new one
    } catch (e) {
      emit(SectionError('Error adding section: $e'));
    }
  }

  void updateSection(Section section) async {
    try {
      await databaseHelper.updateSection(section);
      fetchSections(); // Reload sections after updating
    } catch (e) {
      emit(SectionError('Error updating section: $e'));
    }
  }

  void deleteSection(int sectionId) async {
    try {
      await databaseHelper.deleteSection(sectionId);
      fetchSections(); // Reload sections after deleting
    } catch (e) {
      emit(SectionError('Error deleting section: $e'));
    }
  }

  void renameSection(int index, String newName) {
    final currentState = state;
    if (currentState is SectionsLoaded) {
      final updatedSections = List<Section>.from(currentState.sections);
      updatedSections[index] = updatedSections[index].copyWith(name: newName);
      emit(SectionsLoaded(updatedSections));
    }
  }
}

// class SectionCubit extends Cubit<SectionState> {
//   SectionCubit() : super(SectionInitial());

//   final Box<Section> sectionBox = Hive.box<Section>(kSectionBox);
// ////////////////////////////////////////////////
//   void fetchSections() {
//     emit(FetchSectionsSuccess(sectionBox.values.toList()));
//   }
// ////////////////////////////////////////////////

//   void addSection(String sectionName) {
//     final newSection = Section(
//         name: sectionName,
        // id: (DateTime.now().millisecondsSinceEpoch) % 1000000);
//     sectionBox.add(newSection);
//     emit(AddSection(newSection));

//     fetchSections();
//   }
// ////////////////////////////////////////////////

//   void removeSection(Section section) {
//     section.delete();
//     emit(RemoveSection(section));

//     fetchSections();
//   }

// ////////////////////////////////////////////////

//   void renameSection(int index, String newName) {
//     if (index >= 0 && index < sectionBox.length) {
//       final Section? sectionid = Hive.box<Section>(kSectionBox).getAt(index);
//       if (sectionid == null) {
//         log('null section id: newName: $newName --- ');
//         log('null section id: section: $sectionid --- ');
//         return;
//       }
//       sectionid.name = newName;
//       sectionid.save();
//       fetchSections();
//     }
//   }

// ////////////////////////////////////////////////
//   ///
//   void sectionsSelection(List<Section> sections) {
//     final List<Section> selectedSections = (state is SectionsSelected)
//         ? (state as SectionsSelected).selectedSections
//         : [];

//     // Check if all sections are already selected
//     bool allSelected =
//         selectedSections.every((section) => sections.contains(section));

//     if (allSelected) {
//       // If all are selected, remove all from the selected list
//       selectedSections.removeWhere((section) => sections.contains(section));
//     } else {
//       // If not all are selected, add all to the selected list
//       selectedSections.addAll(sections);
//     }

//     emit(SectionsSelected(List.from(selectedSections)));
//   }

// ////////////////////////////////////////////////

//   void startSelection(bool isSelecting) {
//     isSelecting = true;
//   }

// ////////////////////////////////////////////////
//   void endSelection(bool isSelecting) {
//     isSelecting = false;
//   }
// ////////////////////////////////////////////////

// ////////////////////////////////////////////////
// }
