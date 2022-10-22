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
  late Exercise? assistanceExcercise;
  @HiveField(4)
  late bool isAssistanceExcercise = false;
  @HiveField(5)
  late num? estimatedOneRepMax;
}
