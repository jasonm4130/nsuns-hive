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
  @HiveField(4)
  bool amrap;
  @HiveField(5)
  int repsComplete = 0;

  Set({
    required this.complete,
    required this.reps,
    required this.excercise,
    required this.percentage,
    this.amrap = false,
  });
}
