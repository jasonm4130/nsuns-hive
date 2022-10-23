import 'package:hive/hive.dart';
part 'Exercise.g.dart';

@HiveType(typeId: 2)
class Exercise extends HiveObject {
  @HiveField(0)
  late String uuid;
  @HiveField(1)
  late String name;
  @HiveField(2)
  late num trainingMax;
  @HiveField(3)
  // ignore: avoid_init_to_null
  late num? assistanceScaleFactor = null;
  @HiveField(4)
  // ignore: avoid_init_to_null
  late Exercise? assistanceExcercise = null;
  @HiveField(5)
  late bool isAssistanceExcercise = false;
  @HiveField(6)
  // ignore: avoid_init_to_null
  late num? estimatedOneRepMax = null;

  // Methods
  updateTrainingMax({required num trainingMax}) {
    trainingMax = trainingMax;
  }
}
