import 'package:nsuns/cycle_templates/rep_schemes/t_one_accessory.dart';
import 'package:nsuns/cycle_templates/rep_schemes/t_one_bench_main.dart';
import 'package:nsuns/cycle_templates/rep_schemes/t_one_deadlift_main.dart';
import 'package:nsuns/cycle_templates/rep_schemes/t_one_overhead_press_main.dart';
import 'package:nsuns/cycle_templates/rep_schemes/t_one_squat_main.dart';
import 'package:nsuns/cycle_templates/rep_schemes/t_two_accessory.dart';
import 'package:nsuns/data/Boxes.dart';
import 'package:nsuns/data/Day.dart';
import 'package:uuid/uuid.dart';

var uuid = const Uuid();

List<Day> fiveDayCycleDays() {
  return [
    Day()
      ..uuid = uuid.v4()
      ..tOneExerciseId = Boxes.getExerciseByName(name: 'Bench Press')!.uuid
      ..tTwoExerciseId = Boxes.getExerciseByName(name: 'Overhead Press')!.uuid
      ..tOneSets = [...tOneAccessorySets()]
      ..tTwoSets = [...tTwoSets()]
      ..suggestedAccessories = [
        'chest',
        'back',
        'arms',
      ],
    Day()
      ..uuid = uuid.v4()
      ..tOneExerciseId = Boxes.getExerciseByName(name: 'Squat')!.uuid
      ..tTwoExerciseId = Boxes.getExerciseByName(name: 'Deadlift')!
          .assistanceExcerciseId as String
      ..tOneSets = [...tOneSquatMainSets()]
      ..tTwoSets = [...tTwoSets()]
      ..suggestedAccessories = [
        'legs',
        'abs',
      ],
    Day()
      ..uuid = uuid.v4()
      ..tOneExerciseId = Boxes.getExerciseByName(name: 'Overhead Press')!.uuid
      ..tTwoExerciseId = Boxes.getExerciseByName(name: 'Overhead Press')!
          .assistanceExcerciseId as String
      ..tOneSets = [...tOneOverheadPressMainSets()]
      ..tTwoSets = [...tTwoSets()]
      ..suggestedAccessories = [
        'shoulders',
        'chest',
      ],
    Day()
      ..uuid = uuid.v4()
      ..tOneExerciseId = Boxes.getExerciseByName(name: 'Deadlift')!.uuid
      ..tTwoExerciseId = Boxes.getExerciseByName(name: 'Squat')!
          .assistanceExcerciseId as String
      ..tOneSets = [...tOneDeadliftMain()]
      ..tTwoSets = [...tTwoSets()]
      ..suggestedAccessories = [
        'back',
        'abs',
      ],
    Day()
      ..uuid = uuid.v4()
      ..tOneExerciseId = Boxes.getExerciseByName(name: 'Bench Press')!.uuid
      ..tTwoExerciseId = Boxes.getExerciseByName(name: 'Bench Press')!
          .assistanceExcerciseId as String
      ..tOneSets = [...tOneBenchMainSets()]
      ..tTwoSets = [...tTwoSets()]
      ..suggestedAccessories = [
        'arms',
        'other',
      ],
  ];
}
