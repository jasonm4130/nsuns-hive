// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Cycle.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CycleAdapter extends TypeAdapter<Cycle> {
  @override
  final int typeId = 0;

  @override
  Cycle read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Cycle()
      ..uuid = fields[0] as String
      ..startDate = fields[1] as DateTime
      ..exercises = (fields[2] as List).cast<Exercise>()
      ..days = (fields[3] as List).cast<Day>();
  }

  @override
  void write(BinaryWriter writer, Cycle obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.uuid)
      ..writeByte(1)
      ..write(obj.startDate)
      ..writeByte(2)
      ..write(obj.exercises)
      ..writeByte(3)
      ..write(obj.days);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CycleAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
