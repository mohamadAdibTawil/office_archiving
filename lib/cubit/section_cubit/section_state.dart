part of 'section_cubit.dart';

@immutable
abstract class SectionState {
  const SectionState();
}

class SectionInitial extends SectionState {
  const SectionInitial();
}

class SectionsLoaded extends SectionState {
  final List<Section> sections;

  const SectionsLoaded(this.sections);
}

class SectionError extends SectionState {
  final String error;

  const SectionError(this.error);
}
//  Future<void> updateSection(Section section) async {
//     final Database db = await database;
//     await db.update(
//       sectionTable,
//       section.toMap(),
//       where: 'id = ?',
//       whereArgs: [section.id],
//     );
//   }

//   Future<void> deleteSection(int sectionId) async {
//     final Database db = await database;
//     await db.delete(
//       sectionTable,
//       where: 'id = ?',
//       whereArgs: [sectionId],
//     );
//   }
