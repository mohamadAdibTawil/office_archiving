import 'package:hive/hive.dart';
part 'section.g.dart';
@HiveType(typeId: 0)
class Section extends HiveObject{
  @HiveField(0)
  late String name;
  @HiveField(1)
  late String id;
   Section({required this.name, required this.id});
}
