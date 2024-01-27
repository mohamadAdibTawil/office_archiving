import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:office_archiving/constants.dart';
import 'package:office_archiving/models/item.dart';
import 'package:office_archiving/models/section.dart';

part 'item_section_state.dart';

class ItemSectionCubit extends Cubit<ItemSectionState> {
  ItemSectionCubit() : super(ItemSectionInitial());
  ////////////////////////////////////////////
  // final Box<ItemSection> itemSectionBox =
  //     Hive.box<ItemSection>(kItemSectionBox);
  ////////////////////////////////////////////

  // final Box<Section> sectionBox = Hive.box<Section>(kSectionBox);
  ////////////////////////////////////////////
 void fetchItemsSections() {
    final List<ItemSection> allItemSections = [];

    // Iterate through each Section
    // for (final Section section in sectionBox.values) {
    //   // Add all items from the current Section to the list
    //   if (section.itemsSection != null) {
    //     allItemSections.addAll(section.itemsSection!);
    //   }
    // }

    emit(FetchItemsSectionSuccess(allItemSections));
  }
  ////////////////////////////////////////////
  void fetchItemsSectionSelected(Section selectedSection) {
    final List<ItemSection> itemsInSection = selectedSection.itemsSection ?? [];
    emit(FetchItemsSectionSuccess(itemsInSection));
  }

  // void addItemToSection(ItemSection newItem, Section selectedSection) {
  //   selectedSection.itemsSection ??= [];
  //   selectedSection.itemsSection!.add(newItem);
  //   sectionBox.put(
  //       selectedSection.key, selectedSection); // Update the section in Hive
  //   fetchItemsSectionSelected(
  //       selectedSection); // Notify the cubit to update the state
  // }

  ////////////////////////////////////////////
}
/*class ItemSectionCubit extends Cubit<ItemSectionState> {
  ItemSectionCubit() : super(ItemSectionInitial());

  final Box<ItemSection> itemSectionBox = Hive.box<ItemSection>(kItemSectionBox);
  final Box<Section> sectionBox = Hive.box<Section>(kSectionBox);

  void fetchItemsSections() {
    final Section currentSection = sectionBox.get(widget.section.key); // Use the correct key
    final List<ItemSection> currentSectionItems = currentSection.itemsSection;

    emit(FetchItemsSectionSuccess(currentSectionItems));
  }
}
 */