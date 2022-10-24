import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:nsuns/data/Day.dart';
import 'package:nsuns/data/Exercise.dart';
import 'package:nsuns/utils/consts.dart';
part 'Cycle.g.dart';

@HiveType(typeId: 0)
class Cycle extends HiveObject {
  @HiveField(0)
  late String uuid;
  @HiveField(1)
  late DateTime startDate;
  @HiveField(2)
  late List<Exercise> exercises;
  @HiveField(3)
  late List<Day> days;

  // Methods
  getStartDateFormatted() {
    return DateFormat('LLL d, y').format(startDate);
  }

  getDayFromId({required String key}) {
    return days.firstWhere((day) => day.uuid == key);
  }

  updateExerciseUnits({required String unitsChangingTo}) {
    for (var exercise in exercises) {
      {
        // Check that it's not an assistance exercise
        if (!exercise.isAssistanceExcercise) {
          if (unitsChangingTo == 'kg') {
            // Assume the units are already in lbs and convert to kgs
            exercise.trainingMax =
                exercise.trainingMax! * poundsToKilogramsMultiple;
          }
          if (unitsChangingTo == 'lbs') {
            exercise.trainingMax =
                exercise.trainingMax! * kilogramsToPoundsMultiple;
          }
        }
      }
    }
  }

  getExerciseById({required String? key}) {
    if (key == null) {
      return null;
    }
    return exercises.firstWhere((exercise) => exercise.uuid == key);
  }

  getTotalSets() {
    num totalSets = 0;
    for (var day in days) {
      totalSets = totalSets + day.tOneSets.length;
      totalSets = totalSets + day.tTwoSets.length;
    }
    return totalSets;
  }

  getTotalCompleteSets() {
    num totalCompleteSets = 0;
    for (var day in days) {
      for (var set in day.tOneSets) {
        if (set.isComplete) {
          totalCompleteSets = totalCompleteSets + 1;
        }
      }
      for (var set in day.tTwoSets) {
        if (set.isComplete) {
          totalCompleteSets = totalCompleteSets + 1;
        }
      }
    }
    return totalCompleteSets;
  }

  getPercentageComplete() {
    return getTotalCompleteSets() / getTotalSets();
  }
}
