import 'dart:ffi';

import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
part 'Cycle.g.dart';

@HiveType(typeId: 0)
class Cycle extends HiveObject {
  @HiveField(0)
  String uuid;
  @HiveField(1)
  DateTime startDate;
  @HiveField(2)
  double percentageComplete;

  Cycle({
    required this.startDate,
    required this.uuid,
    this.percentageComplete = 0.0,
  });

  // Methods
  getStartDateFormatted() {
    return DateFormat('LLL d, y').format(startDate);
  }
}
