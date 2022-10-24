import 'package:hive/hive.dart';
part 'Exercise.g.dart';

@HiveType(typeId: 2)
class Exercise extends HiveObject {
  @HiveField(0)
  late String uuid;
  @HiveField(1)
  late String name;
  @HiveField(2)
  // ignore: avoid_init_to_null
  late num? trainingMax = null;
  @HiveField(3)
  // ignore: avoid_init_to_null
  late num? scaleFactor = null;
  @HiveField(4)
  // ignore: avoid_init_to_null
  late String? assistanceExcerciseId = null;
  @HiveField(5)
  late bool isAssistanceExcercise = false;
  @HiveField(6)
  // ignore: avoid_init_to_null
  late num? estimatedOneRepMax = null;
  @HiveField(7)
  late num? currentPR = 0;
  @HiveField(8)
  // ignore: avoid_init_to_null
  late String? mainExerciseId = null;
}
