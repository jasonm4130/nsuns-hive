import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:nsuns/components/set_tile.dart';
import 'package:nsuns/data/Boxes.dart';
import 'package:nsuns/data/Cycle.dart';
import 'package:nsuns/data/Day.dart';
import 'package:nsuns/data/Set.dart';
import 'package:nsuns/data/Exercise.dart';

class ExercisePage extends StatefulWidget {
  const ExercisePage({super.key});
  static const routeName = '/exercise';
  @override
  State<ExercisePage> createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage> {
  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Day'),
      ),
      body: ValueListenableBuilder<Box<Cycle>>(
        valueListenable: Boxes.getCycles().listenable(),
        builder: (context, box, _) {
          final Cycle cycle = Boxes.getCycle(key: arguments['cycleId']);
          final Day day = cycle.getDayFromId(key: arguments['dayId']);
          final String exerciseType = arguments['exerciseType'];
          Exercise? exercise;
          List<Set>? sets;

          if (exerciseType == 'tOne') {
            sets = day.tOneSets;
            exercise = day.tOneExercise;
          }

          if (exerciseType == 'tTwo') {
            sets = day.tTwoSets;
            exercise = day.tTwoExercise;
          }

          return Column(
            children: [
              const SizedBox(height: 10),
              Text(
                exercise!.name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ...sets!.map(
                (set) {
                  return SetTile(
                    set: set,
                    trainingMax: exercise!.trainingMax,
                    cycle: cycle,
                  );
                },
              )
            ],
          );
        },
      ),
    );
  }
}
