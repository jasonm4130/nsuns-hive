import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:nsuns/components/set_tile.dart';
import 'package:nsuns/data/Boxes.dart';
import 'package:nsuns/data/Cycle.dart';
import 'package:nsuns/data/Day.dart';
import 'package:nsuns/data/Set.dart';
import 'package:nsuns/data/Exercise.dart';
import 'package:nsuns/utils/decimal_text_input_formatter.dart';
import 'package:nsuns/utils/decorators.dart';

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
          Exercise? mainExercise;
          List<Set>? sets;

          // If this is the t1 for the day get the t1 exercise
          if (exerciseType == 'tOne') {
            sets = day.tOneSets;
            exercise = cycle.getExerciseById(key: day.tOneExerciseId);
          }

          // If this is the t2 for the day get the t2 exercise
          if (exerciseType == 'tTwo') {
            sets = day.tTwoSets;
            exercise = cycle.getExerciseById(key: day.tTwoExerciseId);
          }

          // If this is an assistance exercise, get the main exercise
          if (exercise!.isAssistanceExcercise) {
            mainExercise = cycle.getExerciseById(key: exercise.mainExerciseId);
          }

          return SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 10),
                Text(
                  exercise.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    decoration: textFieldDecorator(
                        labelText:
                            "${mainExercise != null ? mainExercise.name : exercise.name} TM"),
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      DecimalTextInputFormatter(decimalRange: 2)
                    ],
                    initialValue: mainExercise != null
                        ? mainExercise.trainingMax.toString()
                        : exercise.trainingMax.toString(),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a training max';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      // Get the exercise that we want to update (main if this is an accessory)
                      Exercise exerciseToUpdate;
                      if (mainExercise != null) {
                        exerciseToUpdate = mainExercise;
                      } else {
                        exerciseToUpdate = exercise!;
                      }

                      // Get the main exercise array to update too
                      Exercise? boxExerciseToUpdate =
                          Boxes.getExercise(key: exerciseToUpdate.uuid);

                      // Check that the new value is actually a number
                      if (num.tryParse(value) != null) {
                        // Update the cycle exercise
                        exerciseToUpdate.trainingMax = num.parse(value);
                        // Also update the exercise in the exercise box
                        boxExerciseToUpdate?.trainingMax = num.parse(value);

                        // Save the changes
                        cycle.save();
                        boxExerciseToUpdate?.save();
                      } else {
                        // If the value isn't a valid training max, set the training max to 0
                        exerciseToUpdate.trainingMax = 0;
                        boxExerciseToUpdate?.trainingMax = 0;

                        // Save the changes
                        cycle.save();
                        boxExerciseToUpdate?.save();
                      }
                    },
                  ),
                ),
                const SizedBox(height: 10),
                ...sets!.map(
                  (set) {
                    return SetTile(
                      set: set,
                      cycle: cycle,
                      exercise: exercise!.isAssistanceExcercise
                          ? cycle.getExerciseById(key: exercise.mainExerciseId)
                          : exercise,
                    );
                  },
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
