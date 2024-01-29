import 'dart:convert';
import 'package:collection/collection.dart'; // Import the collection package

import 'package:office_archiving/models/item.dart';

class Section {
  late String name;
  late int id;
  late List<ItemSection>? itemsSection;

  Section({
    required this.name,
    required this.id,
    this.itemsSection,
  });

  Section copyWith({
    String? name,
    int? id,
    List<ItemSection>? itemsSection,
  }) {
    return Section(
      name: name ?? this.name,
      id: id ?? this.id,
      itemsSection: itemsSection ?? this.itemsSection,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'id': id,
      'itemsSection': itemsSection?.map((item) => item.toMap()).toList(),
    };
  }

  factory Section.fromMap(Map<String, dynamic> map) {
    return Section(
      name: map['name'] as String,
      id: map['id'] as int,
      itemsSection: map['itemsSection'] != null
          ? (map['itemsSection'] as List<dynamic>)
              .map((item) => ItemSection.fromMap(item as Map<String, dynamic>))
              .toList()
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Section.fromJson(String source) =>
      Section.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Section(name: $name, id: $id, itemsSection: $itemsSection)';

  @override
  bool operator ==(covariant Section other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.id == id &&
        const DeepCollectionEquality().equals(other.itemsSection, itemsSection);
  }

  @override
  int get hashCode =>
      name.hashCode ^
      id.hashCode ^
      const DeepCollectionEquality().hash(itemsSection);
}
