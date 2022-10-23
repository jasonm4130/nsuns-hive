import 'package:nsuns/cycle_templates/rep_schemes/t_one_accessory.dart';
import 'package:nsuns/cycle_templates/rep_schemes/t_one_bench_main.dart';
import 'package:nsuns/cycle_templates/rep_schemes/t_one_deadlift_main.dart';
import 'package:nsuns/cycle_templates/rep_schemes/t_one_overhead_press_main.dart';
import 'package:nsuns/cycle_templates/rep_schemes/t_one_squat_main.dart';
import 'package:nsuns/cycle_templates/rep_schemes/t_one_volume.dart';
import 'package:nsuns/cycle_templates/rep_schemes/t_two_accessory.dart';
import 'package:nsuns/cycle_templates/rep_schemes/t_two_volume.dart';
import 'package:nsuns/data/Boxes.dart';
import 'package:nsuns/data/Day.dart';
import 'package:nsuns/data/Exercise.dart';
import 'package:uuid/uuid.dart';

var uuid = const Uuid();

List<Day> sixDaySquatCycleDays() {
  return [
    Day()
      ..uuid = uuid.v4()
      ..tOneExercise = Boxes.getExerciseByName(name: 'Bench Press') as Exercise
      ..tTwoExercise =
          Boxes.getExerciseByName(name: 'Overhead Press') as Exercise
      ..tOneSets = [...tOneAccessorySets()]
      ..tTwoSets = [...tTwoSets()]
      ..suggestedAccessories = [
        'chest',
        'back',
        'arms',
      ],
    Day()
      ..uuid = uuid.v4()
      ..tOneExercise = Boxes.getExerciseByName(name: 'Squat') as Exercise
      ..tTwoExercise = Boxes.getExerciseByName(name: 'Deadlift')!
          .assistanceExcercise as Exercise
      ..tOneSets = [...tOneSquatMainSets()]
      ..tTwoSets = [...tTwoSets()]
      ..suggestedAccessories = [
        'legs',
        'abs',
      ],
    Day()
      ..uuid = uuid.v4()
      ..tOneExercise =
          Boxes.getExerciseByName(name: 'Overhead Press') as Exercise
      ..tTwoExercise = Boxes.getExerciseByName(name: 'Overhead Press')!
          .assistanceExcercise as Exercise
      ..tOneSets = [...tOneOverheadPressMainSets()]
      ..tTwoSets = [...tTwoSets()]
      ..suggestedAccessories = [
        'shoulders',
        'chest',
      ],
    Day()
      ..uuid = uuid.v4()
      ..tOneExercise = Boxes.getExerciseByName(name: 'Deadlift') as Exercise
      ..tTwoExercise = Boxes.getExerciseByName(name: 'Squat')!
          .assistanceExcercise as Exercise
      ..tOneSets = [...tOneDeadliftMain()]
      ..tTwoSets = [...tTwoSets()]
      ..suggestedAccessories = [
        'back',
        'abs',
      ],
    Day()
      ..uuid = uuid.v4()
      ..tOneExercise = Boxes.getExerciseByName(name: 'Bench Press') as Exercise
      ..tTwoExercise = Boxes.getExerciseByName(name: 'Bench Press')!
          .assistanceExcercise as Exercise
      ..tOneSets = [...tOneBenchMainSets()]
      ..tTwoSets = [...tTwoSets()]
      ..suggestedAccessories = [
        'arms',
        'other',
      ],
    Day()
      ..uuid = uuid.v4()
      ..tOneExercise = Boxes.getExerciseByName(name: 'Squat') as Exercise
      ..tTwoExercise = Boxes.getExerciseByName(name: 'Squat')!
          .assistanceExcercise as Exercise
      ..tOneSets = [...tOneVolumeSets()]
      ..tTwoSets = [...tTwoVolumeSets()]
      ..suggestedAccessories = [
        'arms',
        'other',
      ],
  ];
}
