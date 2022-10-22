// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Exercise.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ExerciseAdapter extends TypeAdapter<Exercise> {
  @override
  final int typeId = 2;

  @override
  Exercise read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Exercise()
      ..uuid = fields[0] as String
      ..name = fields[1] as String
      ..trainingMax = fields[2] as num
      ..assistanceExcercise = fields[3] as Exercise?
      ..isAssistanceExcercise = fields[4] as bool;
  }

  @override
  void write(BinaryWriter writer, Exercise obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.uuid)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.trainingMax)
      ..writeByte(3)
      ..write(obj.assistanceExcercise)
      ..writeByte(4)
      ..write(obj.isAssistanceExcercise);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExerciseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
