import 'package:collection/collection.dart';
import 'package:hive/hive.dart';
import 'package:nsuns/data/TrainingMax.dart';
part 'Exercise.g.dart';

@HiveType(typeId: 2)
class Exercise extends HiveObject {
  @HiveField(0)
  late String uuid;
  @HiveField(1)
  late String name;
  @HiveField(2)
  // ignore: avoid_init_to_null
  late num? scaleFactor = null;
  @HiveField(3)
  // ignore: avoid_init_to_null
  late String? assistanceExcerciseId = null;
  @HiveField(4)
  late bool isAssistanceExcercise = false;
  @HiveField(5)
  // ignore: avoid_init_to_null
  late num? estimatedOneRepMax = null;
  @HiveField(6)
  late num? currentPR = 0;
  @HiveField(7)
  // ignore: avoid_init_to_null
  late String? mainExerciseId = null;
  // Training max at specific date
  @HiveField(8)
  late List<TrainingMax> trainingMaxData = [];

  // methods
  TrainingMax? getTrainMaxByCycleId({required String id}) {
    // Get the training max with the current cycle id
    return trainingMaxData
        .firstWhereOrNull((trainingMax) => trainingMax.linkedCycleUuid == id);
  }
}
