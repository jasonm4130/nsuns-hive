// Class that sets up the tempalte
import 'package:nsuns/data/Database.dart';
import 'package:nsuns/data/Day.dart';
import 'package:nsuns/data/RepScheme.dart';
import 'package:nsuns/data/Set.dart';

class Template {
  final String name;
  final String shortName;
  final List<Day> days;

  Template({required this.name, required this.shortName, required this.days});
}

getBench() {
  return NsunsDataBase.excercises
      .firstWhere((excercise) => excercise.name == 'Squat');
}

getSquat() {
  return NsunsDataBase.excercises
      .firstWhere((excercise) => excercise.name == 'Squat');
}

getDeadlift() {
  return NsunsDataBase.excercises
      .firstWhere((excercise) => excercise.name == 'Squat');
}

getOverheadPress() {
  return NsunsDataBase.excercises
      .firstWhere((excercise) => excercise.name == 'Squat');
}

fourDayTemplate() {
  return Template(
    name: 'Four Day',
    shortName: 'fourDay',
    days: [
      Day(
        dayNumber: 1,
        repSchemes: [
          RepScheme(
            excercise: getBench(),
            sets: [
              Set(
                complete: false,
                reps: 8,
                excercise: getBench(),
                percentage: 0.65,
              ),
              Set(
                complete: false,
                reps: 6,
                excercise: getBench(),
                percentage: 0.75,
              ),
              Set(
                complete: false,
                reps: 4,
                excercise: getBench(),
                percentage: 0.85,
              ),
              Set(
                complete: false,
                reps: 4,
                excercise: getBench(),
                percentage: 0.85,
              ),
              Set(
                complete: false,
                reps: 4,
                excercise: getBench(),
                percentage: 0.85,
              ),
              Set(
                complete: false,
                reps: 5,
                excercise: getBench(),
                percentage: 0.80,
              ),
              Set(
                complete: false,
                reps: 6,
                excercise: getBench(),
                percentage: 0.75,
              ),
              Set(
                complete: false,
                reps: 7,
                excercise: getBench(),
                percentage: 0.70,
              ),
              Set(
                complete: false,
                reps: 8,
                excercise: getBench(),
                percentage: 0.65,
                amrap: true,
              ),
            ],
          ),
          RepScheme(
            excercise: getOverheadPress(),
            sets: [
              Set(
                complete: false,
                reps: 6,
                excercise: getOverheadPress(),
                percentage: 0.5,
              ),
              Set(
                complete: false,
                reps: 5,
                excercise: getOverheadPress(),
                percentage: 0.6,
              ),
              Set(
                complete: false,
                reps: 3,
                excercise: getOverheadPress(),
                percentage: 0.7,
              ),
              Set(
                complete: false,
                reps: 5,
                excercise: getOverheadPress(),
                percentage: 0.7,
              ),
              Set(
                complete: false,
                reps: 7,
                excercise: getOverheadPress(),
                percentage: 0.7,
              ),
              Set(
                complete: false,
                reps: 4,
                excercise: getOverheadPress(),
                percentage: 0.7,
              ),
              Set(
                complete: false,
                reps: 6,
                excercise: getOverheadPress(),
                percentage: 0.7,
              ),
              Set(
                complete: false,
                reps: 8,
                excercise: getOverheadPress(),
                percentage: 0.70,
              ),
            ],
          ),
        ],
      ),
      Day(
        dayNumber: 1,
        repSchemes: [
          RepScheme(
            excercise: getBench(),
            sets: [
              Set(
                complete: false,
                reps: 8,
                excercise: getBench(),
                percentage: 0.65,
              ),
              Set(
                complete: false,
                reps: 6,
                excercise: getBench(),
                percentage: 0.75,
              ),
              Set(
                complete: false,
                reps: 4,
                excercise: getBench(),
                percentage: 0.85,
              ),
              Set(
                complete: false,
                reps: 4,
                excercise: getBench(),
                percentage: 0.85,
              ),
              Set(
                complete: false,
                reps: 4,
                excercise: getBench(),
                percentage: 0.85,
              ),
              Set(
                complete: false,
                reps: 5,
                excercise: getBench(),
                percentage: 0.80,
              ),
              Set(
                complete: false,
                reps: 6,
                excercise: getBench(),
                percentage: 0.75,
              ),
              Set(
                complete: false,
                reps: 7,
                excercise: getBench(),
                percentage: 0.70,
              ),
              Set(
                complete: false,
                reps: 8,
                excercise: getBench(),
                percentage: 0.65,
                amrap: true,
              ),
            ],
          ),
          RepScheme(
            excercise: getOverheadPress(),
            sets: [
              Set(
                complete: false,
                reps: 6,
                excercise: getOverheadPress(),
                percentage: 0.5,
              ),
              Set(
                complete: false,
                reps: 5,
                excercise: getOverheadPress(),
                percentage: 0.6,
              ),
              Set(
                complete: false,
                reps: 3,
                excercise: getOverheadPress(),
                percentage: 0.7,
              ),
              Set(
                complete: false,
                reps: 5,
                excercise: getOverheadPress(),
                percentage: 0.7,
              ),
              Set(
                complete: false,
                reps: 7,
                excercise: getOverheadPress(),
                percentage: 0.7,
              ),
              Set(
                complete: false,
                reps: 4,
                excercise: getOverheadPress(),
                percentage: 0.7,
              ),
              Set(
                complete: false,
                reps: 6,
                excercise: getOverheadPress(),
                percentage: 0.7,
              ),
              Set(
                complete: false,
                reps: 8,
                excercise: getOverheadPress(),
                percentage: 0.70,
              ),
            ],
          ),
        ],
      )
    ],
  );
}
