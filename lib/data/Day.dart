import 'package:hive/hive.dart';
import 'package:nsuns/data/Exercise.dart';
import 'package:nsuns/data/Set.dart';
part 'Day.g.dart';

@HiveType(typeId: 1)
class Day extends HiveObject {
  @HiveField(0)
  late String uuid;
  @HiveField(1)
  late Exercise tOneExercise;
  @HiveField(2)
  late Exercise tTwoExercise;
  @HiveField(3)
  late List<Set> tOneSets;
  @HiveField(4)
  late List<Set> tTwoSets;
  @HiveField(5)
  // ignore: avoid_init_to_null
  late Map? accessories = null;
  @HiveField(6)
  late List<String> suggestedAccessories;
}
