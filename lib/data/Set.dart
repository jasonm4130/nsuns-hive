import 'package:hive/hive.dart';
part 'Set.g.dart';

@HiveType(typeId: 3)
class Set extends HiveObject {
  @HiveField(0)
  late int reps;
  @HiveField(1)
  late num? percentage;
  @HiveField(2)
  late bool isAmrap = false;
  @HiveField(3)
  late num repsCompleted = reps;
  @HiveField(4)
  late bool isComplete = false;
  @HiveField(5)
  // ignore: avoid_init_to_null
  late num? weight = null;

  // Methods
  updateWeight({required num weight}) {
    this.weight = weight;
  }

  updateRepsCompleted({required num repsCompleted}) {
    this.repsCompleted = repsCompleted;
  }

  toggleCompleteStatus() {
    isComplete = !isComplete;
  }
}
