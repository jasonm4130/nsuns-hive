// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RepScheme.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RepSchemeAdapter extends TypeAdapter<RepScheme> {
  @override
  final int typeId = 3;

  @override
  RepScheme read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RepScheme(
      excercise: fields[0] as Excercise,
      sets: (fields[2] as List).cast<dynamic>(),
    );
  }

  @override
  void write(BinaryWriter writer, RepScheme obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.excercise)
      ..writeByte(2)
      ..write(obj.sets);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RepSchemeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
