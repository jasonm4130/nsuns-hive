// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Day.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DayAdapter extends TypeAdapter<Day> {
  @override
  final int typeId = 1;

  @override
  Day read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Day()
      ..uuid = fields[0] as String
      ..tOneExerciseId = fields[1] as String
      ..tTwoExerciseId = fields[2] as String
      ..tOneSets = (fields[3] as List).cast<Set>()
      ..tTwoSets = (fields[4] as List).cast<Set>()
      ..accessories = (fields[5] as Map?)?.cast<dynamic, dynamic>()
      ..suggestedAccessories = (fields[6] as List).cast<String>();
  }

  @override
  void write(BinaryWriter writer, Day obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.uuid)
      ..writeByte(1)
      ..write(obj.tOneExerciseId)
      ..writeByte(2)
      ..write(obj.tTwoExerciseId)
      ..writeByte(3)
      ..write(obj.tOneSets)
      ..writeByte(4)
      ..write(obj.tTwoSets)
      ..writeByte(5)
      ..write(obj.accessories)
      ..writeByte(6)
      ..write(obj.suggestedAccessories);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DayAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
