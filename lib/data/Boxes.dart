import 'package:hive/hive.dart';
import 'package:nsuns/data/Cycle.dart';
import 'package:nsuns/data/Exercise.dart';

class Boxes {
  // Static methods for getting the cycles and a single cycle
  static Box<Cycle> getCycles() => Hive.box<Cycle>('cycles');
  static getCycle({required String key}) => Hive.box<Cycle>('cycles').get(key);
  static updateCycle({required String key, required Cycle value}) =>
      Hive.box<Cycle>('cycles').put(key, value);

  // Static methods for getting the exercises and a single exercise
  static Box<Exercise> getExercises() => Hive.box<Exercise>('exercises');
  static Exercise? getExercise({required String key}) =>
      Hive.box<Exercise>('exercises').get(key);
  static updateExercise({required String key, required Exercise value}) =>
      Hive.box<Exercise>('exercises').put(key, value);
  static Exercise? getExerciseByName({required String name}) =>
      Hive.box<Exercise>('exercises')
          .values
          .firstWhere((exercise) => exercise.name == name);

  // Static method to get the settings box
  static Box getSettings() => Hive.box('settings');
  static getSetting({required String key}) => Hive.box('settings').get(key);
  static addSetting({required String key, required value}) =>
      Hive.box('settings').put(key, value);
  static updateSetting({required String key, required value}) =>
      Hive.box('settings').put(key, value);
}
