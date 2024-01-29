import 'dart:convert';
import 'dart:io';

class ItemSection {
  late int id;
  late String itemName;
  late String? filePath;
  late String? fileType;
  late File? file;
  ItemSection({
    required this.id,
    required this.itemName,
    this.filePath,
    this.fileType,
    this.file,
  });

  ItemSection copyWith({
    int? id,
    String? itemName,
    String? filePath,
    String? fileType,
    File? file,
  }) {
    return ItemSection(
      id: id ?? this.id,
      itemName: itemName ?? this.itemName,
      filePath: filePath ?? this.filePath,
      fileType: fileType ?? this.fileType,
      file: file ?? this.file,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'itemName': itemName,
      'filePath': filePath,
      'fileType': fileType,
      'file': file,
    };
  }

//
  factory ItemSection.fromMap(Map<String, dynamic> map) {
    return ItemSection(
      id: map['id'] as int,
      itemName: map['itemName'] as String,
      filePath: map['filePath'] != null ? map['filePath'] as String : null,
      fileType: map['fileType'] != null ? map['fileType'] as String : null,
      file: map['file'] != null ? map['file'] as File : null,
      // 'file': map['file'] != null ? File.fromMap(map['file'] as Map<String, dynamic>) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ItemSection.fromJson(String source) =>
      ItemSection.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ItemSection(id: $id, itemName: $itemName, filePath: $filePath, fileType: $fileType, file: $file)';
  }

  @override
  bool operator ==(covariant ItemSection other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.itemName == itemName &&
        other.filePath == filePath &&
        other.fileType == fileType &&
        other.file == file;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        itemName.hashCode ^
        filePath.hashCode ^
        fileType.hashCode ^
        file.hashCode;
  }
}
