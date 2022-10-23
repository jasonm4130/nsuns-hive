import 'package:flutter/material.dart';
import 'package:nsuns/data/Cycle.dart';
import 'package:nsuns/data/Day.dart';
import 'package:nsuns/data/Exercise.dart';
import 'package:nsuns/data/Set.dart';
import 'package:nsuns/pages/exercise_page.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ExerciseTile extends StatelessWidget {
  final Exercise exercise;
  final String exerciseType;
  final List<Set> sets;
  final Day day;
  final Cycle cycle;
  const ExerciseTile({
    super.key,
    required this.exercise,
    required this.exerciseType,
    required this.sets,
    required this.cycle,
    required this.day,
  });

  getCompletedSetCount() {
    num completedSets = 0;
    for (var set in sets) {
      if (set.isComplete) {
        completedSets = completedSets++;
      }
    }
    return completedSets;
  }

  @override
  Widget build(BuildContext context) {
    num setsCompleted = getCompletedSetCount();
    print("setsCompleted: $setsCompleted");
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
                      Text("$setsCompleted of ${sets.length} sets finished"),
                      const SizedBox(
                        height: 10,
                      ),
                      LinearPercentIndicator(
                        percent: setsCompleted / sets.length,
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
