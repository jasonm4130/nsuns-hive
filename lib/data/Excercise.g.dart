// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Excercise.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ExcerciseAdapter extends TypeAdapter<Excercise> {
  @override
  final int typeId = 1;

  @override
  Excercise read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Excercise(
      fields[0] as String,
      fields[1] as double,
      fields[2] as double,
    );
  }

  @override
  void write(BinaryWriter writer, Excercise obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.estimatedMax)
      ..writeByte(2)
      ..write(obj.trainingMax);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExcerciseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
