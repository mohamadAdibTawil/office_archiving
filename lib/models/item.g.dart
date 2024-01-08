// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SectionItemAdapter extends TypeAdapter<SectionItem> {
  @override
  final int typeId = 1;

  @override
  SectionItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SectionItem()
      ..itemName = fields[0] as String
      ..file = fields[1] as File;
  }

  @override
  void write(BinaryWriter writer, SectionItem obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.itemName)
      ..writeByte(1)
      ..write(obj.file);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SectionItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
