import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:nsuns/data/Day.dart';
part 'Cycle.g.dart';

@HiveType(typeId: 0)
class Cycle extends HiveObject {
  @HiveField(0)
  late String uuid;
  @HiveField(1)
  late DateTime startDate;
  @HiveField(2)
  late List<Day> days;

  // Methods
  getStartDateFormatted() {
    return DateFormat('LLL d, y').format(startDate);
  }

  getDayFromId({required String key}) {
    return days.firstWhere((day) => day.uuid == key);
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
