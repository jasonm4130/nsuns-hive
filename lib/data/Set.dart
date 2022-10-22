import 'package:hive/hive.dart';
part 'Set.g.dart';

@HiveType(typeId: 1)
class Cycle extends HiveObject {
  @HiveField(0)
  late int reps;
  @HiveField(1)
  late num percentage;
  @HiveField(2)
  late bool isAmrap;
  @HiveField(3)
  late bool isComplete = false;
}
