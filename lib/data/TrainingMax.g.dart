// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TrainingMax.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TrainingMaxAdapter extends TypeAdapter<TrainingMax> {
  @override
  final int typeId = 4;

  @override
  TrainingMax read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TrainingMax()
      ..trainingMax = fields[0] as num
      ..date = fields[1] as DateTime;
  }

  @override
  void write(BinaryWriter writer, TrainingMax obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.trainingMax)
      ..writeByte(1)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TrainingMaxAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
