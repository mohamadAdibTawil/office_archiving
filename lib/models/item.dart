import 'dart:io';

import 'package:hive_flutter/hive_flutter.dart';
part 'item.g.dart';

@HiveType(typeId: 1)
class ItemSection extends HiveObject {
  @HiveField(0)
  late String itemName;

  @HiveField(1)
  late File file;
}
