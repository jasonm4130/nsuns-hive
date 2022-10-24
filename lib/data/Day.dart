import 'package:hive/hive.dart';
import 'package:nsuns/data/Set.dart';
part 'Day.g.dart';

@HiveType(typeId: 1)
class Day extends HiveObject {
  @HiveField(0)
  late String uuid;
  @HiveField(1)
  late String tOneExerciseId;
  @HiveField(2)
  late String tTwoExerciseId;
  @HiveField(3)
  late List<Set> tOneSets;
  @HiveField(4)
  late List<Set> tTwoSets;
  @HiveField(5)
  // ignore: avoid_init_to_null
  late Map? accessories = null;
  @HiveField(6)
  late List<String> suggestedAccessories;

  // Methods
  getTotalSets() {
    num totalSets = tOneSets.length + tTwoSets.length;
    return totalSets;
  }

  getTOneCompleteSets() {
    num totalCompleteSets = 0;
    for (var set in tOneSets) {
      if (set.isComplete) {
        totalCompleteSets = totalCompleteSets + 1;
      }
    }
    return totalCompleteSets;
  }

  getTTwoCompleteSets() {
    num totalCompleteSets = 0;
    for (var set in tTwoSets) {
      if (set.isComplete) {
        totalCompleteSets = totalCompleteSets + 1;
      }
    }
    return totalCompleteSets;
  }
}
