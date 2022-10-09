import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:nsuns/data/Excercise.dart';
part 'Cycle.g.dart';

@HiveType(typeId: 0)
class Cycle extends HiveObject {
  @HiveField(0)
  String uuid;
  @HiveField(1)
  DateTime startDate;
  @HiveField(2)
  double percentageComplete;
  @HiveField(3)
  List<Excercise>? excercises;

  Cycle({
    required this.startDate,
    required this.uuid,
    this.percentageComplete = 0.0,
    this.excercises,
  });

  // Methods
  getStartDateFormatted() {
    return DateFormat('LLL d, y').format(startDate);
  }
}
