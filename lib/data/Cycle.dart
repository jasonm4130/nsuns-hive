import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
part 'Cycle.g.dart';

@HiveType(typeId: 0)
class Cycle extends HiveObject {
  @HiveField(0)
  late String uuid;
  @HiveField(1)
  late DateTime startDate;

  // Methods
  getStartDateFormatted() {
    return DateFormat('LLL d, y').format(startDate);
  }
}
