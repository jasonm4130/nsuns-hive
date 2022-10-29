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
      ..scaleFactor = fields[2] as num?
      ..assistanceExcerciseId = fields[3] as String?
      ..isAssistanceExcercise = fields[4] as bool
      ..estimatedOneRepMax = fields[5] as num?
      ..currentPR = fields[6] as num?
      ..mainExerciseId = fields[7] as String?
      ..trainingMaxData = (fields[8] as List).cast<TrainingMax>();
  }

  @override
  void write(BinaryWriter writer, Exercise obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.uuid)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.scaleFactor)
      ..writeByte(3)
      ..write(obj.assistanceExcerciseId)
      ..writeByte(4)
      ..write(obj.isAssistanceExcercise)
      ..writeByte(5)
      ..write(obj.estimatedOneRepMax)
      ..writeByte(6)
      ..write(obj.currentPR)
      ..writeByte(7)
      ..write(obj.mainExerciseId)
      ..writeByte(8)
      ..write(obj.trainingMaxData);
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
