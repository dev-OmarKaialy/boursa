// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wish_list_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WishListModelAdapter extends TypeAdapter<WishListModel> {
  @override
  final int typeId = 0;

  @override
  WishListModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WishListModel(
      id: fields[0] as String,
      name: fields[1] as String,
      details: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, WishListModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.details);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WishListModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
