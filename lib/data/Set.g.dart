// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Set.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SetAdapter extends TypeAdapter<Set> {
  @override
  final int typeId = 3;

  @override
  Set read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Set()
      ..reps = fields[0] as int
      ..percentage = fields[1] as num?
      ..isAmrap = fields[2] as bool
      ..repsCompleted = fields[3] as num
      ..isComplete = fields[4] as bool
      ..weight = fields[5] as num?;
  }

  @override
  void write(BinaryWriter writer, Set obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.reps)
      ..writeByte(1)
      ..write(obj.percentage)
      ..writeByte(2)
      ..write(obj.isAmrap)
      ..writeByte(3)
      ..write(obj.repsCompleted)
      ..writeByte(4)
      ..write(obj.isComplete)
      ..writeByte(5)
      ..write(obj.weight);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SetAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
