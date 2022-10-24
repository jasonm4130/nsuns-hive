import 'package:flutter/material.dart';
import 'package:nsuns/data/Cycle.dart';
import 'package:nsuns/data/Day.dart';
import 'package:nsuns/data/Exercise.dart';
import 'package:nsuns/data/Set.dart';
import 'package:nsuns/pages/exercise_page.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ExerciseTile extends StatelessWidget {
  final String exerciseId;
  final String exerciseType;
  final List<Set> sets;
  final Day day;
  final Cycle cycle;
  const ExerciseTile({
    super.key,
    required this.exerciseId,
    required this.exerciseType,
    required this.sets,
    required this.cycle,
    required this.day,
  });

  @override
  Widget build(BuildContext context) {
    num completedSets = 0;
    Exercise exercise =
        cycle.exercises.firstWhere((exercise) => exercise.uuid == exerciseId);
    if (exerciseType == 'tOne') {
      completedSets = day.getTOneCompleteSets();
    }
    if (exerciseType == 'tTwo') {
      completedSets = day.getTTwoCompleteSets();
    }
    return InkWell(
      onTap: () =>
          Navigator.pushNamed(context, ExercisePage.routeName, arguments: {
        'cycleId': cycle.uuid,
        'dayId': day.uuid,
        'exerciseType': exerciseType,
      }),
      child: Card(
        margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
        child: SizedBox(
          height: 70,
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(exercise.name),
                      Text("$completedSets of ${sets.length} sets finished"),
                      const SizedBox(
                        height: 10,
                      ),
                      LinearPercentIndicator(
                        percent: completedSets / sets.length,
                        lineHeight: 5,
                        barRadius: const Radius.circular(2.5),
                        padding: EdgeInsets.zero,
                      ),
                    ],
                  ),
                ),
              ),
              const Icon(
                Icons.chevron_right,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
