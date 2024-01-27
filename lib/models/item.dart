// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:io';

class ItemSection {
  late String itemName;
  late String? filePath;
  late String? fileType;
  late File? file;

  ItemSection({
    required this.itemName,
    this.filePath,
    this.fileType,
    this.file,
  });

  ItemSection copyWith({
    String? itemName,
    String? filePath,
    String? fileType,
    File? file,
  }) {
    return ItemSection(
      itemName: itemName ?? this.itemName,
      filePath: filePath ?? this.filePath,
      fileType: fileType ?? this.fileType,
      file: file ?? this.file,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'itemName': itemName,
      'filePath': filePath,
      'fileType': fileType,
      // Assuming you don't need to convert File to Map here
      // 'file': file?.toMap(),
    };
  }

  factory ItemSection.fromMap(Map<String, dynamic> map) {
    return ItemSection(
      itemName: map['itemName'] as String,
      filePath: map['filePath'] as String?,
      fileType: map['fileType'] as String?,
      // Assuming you don't need to convert Map to File here
      // 'file': map['file'] != null ? File.fromMap(map['file'] as Map<String, dynamic>) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ItemSection.fromJson(String source) =>
      ItemSection.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ItemSection(itemName: $itemName, filePath: $filePath, fileType: $fileType, file: $file)';
  }

  @override
  bool operator ==(covariant ItemSection other) {
    if (identical(this, other)) return true;

    return other.itemName == itemName &&
        other.filePath == filePath &&
        other.fileType == fileType &&
        other.file == file;
  }

  @override
  int get hashCode {
    return itemName.hashCode ^
        filePath.hashCode ^
        fileType.hashCode ^
        file.hashCode;
  }
}
