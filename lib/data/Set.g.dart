// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Set.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SetAdapter extends TypeAdapter<Set> {
  @override
  final int typeId = 2;

  @override
  Set read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Set(
      complete: fields[0] as bool,
      reps: fields[1] as int,
      excercise: fields[2] as Excercise,
      percentage: fields[3] as double,
      amrap: fields[4] as bool,
    )..repsComplete = fields[5] as int;
  }

  @override
  void write(BinaryWriter writer, Set obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.complete)
      ..writeByte(1)
      ..write(obj.reps)
      ..writeByte(2)
      ..write(obj.excercise)
      ..writeByte(3)
      ..write(obj.percentage)
      ..writeByte(4)
      ..write(obj.amrap)
      ..writeByte(5)
      ..write(obj.repsComplete);
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
