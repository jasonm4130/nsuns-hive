import 'package:hive/hive.dart';
part 'TrainingMax.g.dart';

@HiveType(typeId: 4)
class TrainingMax extends HiveObject {
  @HiveField(0)
  late num trainingMax;
  @HiveField(1)
  late DateTime date;
  @HiveField(2)
  // ignore: avoid_init_to_null
  late String? linkedCycleUuid = null;
}
