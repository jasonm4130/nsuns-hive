import 'package:hive/hive.dart';
import 'Excercise.dart';

part 'Set.g.dart';

@HiveType(typeId: 2)
class Set {
  @HiveField(0)
  bool complete;
  @HiveField(1)
  int reps;
  @HiveField(2)
  Excercise excercise;
  @HiveField(3)
  double percentage;

  Set(this.complete, this.reps, this.excercise, this.percentage);
}
