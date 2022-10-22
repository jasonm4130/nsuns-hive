import 'package:hive/hive.dart';
import 'package:nsuns/data/Cycle.dart';
import 'package:nsuns/data/Exercise.dart';

class Boxes {
  // Static methods for getting the cycles and a single cycle
  static Box<Cycle> getCycles() => Hive.box<Cycle>('cycles');
  static Cycle? getCycle(String key) => Hive.box<Cycle>('cycles').get(key);

  // Static methods for getting the exercises and a single exercise
  static Box<Exercise> getExercises() => Hive.box<Exercise>('exercises');
  static Exercise? getExercise(String key) =>
      Hive.box<Exercise>('exercises').get(key);
}
