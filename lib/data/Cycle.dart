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
        if (unitsChangingTo == 'kg') {
          // Assume the units are already in lbs and convert to kgs
          exercise.updateTrainingMax(
              trainingMax: exercise.trainingMax * poundsToKilogramsMultiple);
          exercise.assistanceExcercise!.updateTrainingMax(
              trainingMax: exercise.assistanceExcercise!.trainingMax *
                  poundsToKilogramsMultiple);
        }
        if (unitsChangingTo == 'lbs') {
          exercise.updateTrainingMax(
              trainingMax: exercise.trainingMax * kilogramsToPoundsMultiple);
          exercise.assistanceExcercise!.updateTrainingMax(
              trainingMax: exercise.assistanceExcercise!.trainingMax *
                  kilogramsToPoundsMultiple);
        }
      }
    }
  }

  getPercentageComplete() {
    num totalSets = 0;
    num completedSets = 0;

    // For all of the days in the cycle
    for (var day in days) {
      {
        // For all of the sets in the day
        for (var set in day.tOneSets) {
          // If the set is complete add one the the completed set
          if (set.isComplete) {
            completedSets = completedSets++;
          }
          // Always add one to the total sets
          totalSets = totalSets++;
        }
      }
    }
    // If there are 0 completed sets, we just need to return 0
    if (completedSets == 0) {
      return 0;
    }

    // Otherwise caculate the percantage of the cycle that has been completed
    return (completedSets / totalSets) * 100;
  }
}
