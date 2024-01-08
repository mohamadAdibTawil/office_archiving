part of 'section_cubit.dart';

@immutable
sealed class SectionState {}

final class SectionInitial extends SectionState {}

final class FetchSectionsSuccess extends SectionState {
  final List<Section> sections;

  FetchSectionsSuccess(this.sections);
}

final class SectionsSelected extends SectionState {
  final List<Section> selectedSections;

  SectionsSelected(this.selectedSections);
}
final class AddSection extends SectionState {
  final Section section;

  AddSection(this.section);
}

final class RemoveSection extends SectionState {
  final Section section;

  RemoveSection(this.section);
}

final class SectionRenamed extends SectionState {
  final int sectionId;
  final String newName;

  SectionRenamed({required this.sectionId, required this.newName});
}
