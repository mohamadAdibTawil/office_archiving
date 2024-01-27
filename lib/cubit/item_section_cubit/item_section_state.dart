part of 'item_section_cubit.dart';

@immutable
sealed class ItemSectionState {}

final class ItemSectionInitial extends ItemSectionState {}

final class FetchItemsSectionSuccess extends ItemSectionState {
  final List<ItemSection> itemSections;

  FetchItemsSectionSuccess(this.itemSections);

}