import 'package:hive/hive.dart';

part 'Excercise.g.dart';

@HiveType(typeId: 1)
class Excercise {
  @HiveField(0)
  String name;
  @HiveField(1)
  double estimatedMax;
  @HiveField(2)
  double trainingMax;

  Excercise(this.name, this.estimatedMax, this.trainingMax);
}