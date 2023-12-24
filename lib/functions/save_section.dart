import 'package:hive/hive.dart';
import 'package:office_archiving/constants.dart';
import 'package:office_archiving/models/section.dart';

class SectionHive {
  static Box<Section> openSectionBox() {
    return Hive.box<Section>(kSectionBox);
  }

  static Future<void> addSectionToHive(
      Box<Section> box, Section section) async {
    await box.add(section);
  }
}
