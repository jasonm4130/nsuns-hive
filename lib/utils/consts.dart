import 'package:nsuns/cycle_templates/templates/five_day.dart';
import 'package:nsuns/cycle_templates/templates/four_day.dart';
import 'package:nsuns/cycle_templates/templates/six_day_deadlift.dart';
import 'package:nsuns/cycle_templates/templates/six_day_squat.dart';

num poundsToKilogramsMultiple = 2.2046;
num kilogramsToPoundsMultiple = 0.454;
Map templates = {
  '4 Day': fourDayCycleDays,
  '5 Day': fiveDayCycleDays,
  '6 Day (Squat)': sixDaySquatCycleDays,
  '6 Day (Deadlift)': sixDayDeadliftCycleDays,
};
