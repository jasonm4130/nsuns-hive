// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Set.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CycleAdapter extends TypeAdapter<Cycle> {
  @override
  final int typeId = 1;

  @override
  Cycle read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Cycle()
      ..reps = fields[0] as int
      ..percentage = fields[1] as num
      ..isAmrap = fields[2] as bool
      ..isComplete = fields[3] as bool;
  }

  @override
  void write(BinaryWriter writer, Cycle obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.reps)
      ..writeByte(1)
      ..write(obj.percentage)
      ..writeByte(2)
      ..write(obj.isAmrap)
      ..writeByte(3)
      ..write(obj.isComplete);
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
