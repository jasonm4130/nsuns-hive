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
          List<Set>? sets;

          if (exerciseType == 'tOne') {
            sets = day.tOneSets;
            exercise = cycle.exercises
                .firstWhere((element) => element.uuid == day.tOneExerciseId);
          }

          if (exerciseType == 'tTwo') {
            sets = day.tTwoSets;
            exercise = cycle.exercises
                .firstWhere((element) => element.uuid == day.tTwoExerciseId);
          }

          return SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 10),
                Text(
                  exercise!.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    decoration:
                        textFieldDecorator(labelText: "${exercise.name} TM"),
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      DecimalTextInputFormatter(decimalRange: 2)
                    ],
                    initialValue: exercise.trainingMax.toString(),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a training max';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      // Check that the new value is actually a number
                      if (num.tryParse(value) != null) {
                        // Update the cycle exercise
                        cycle.exercises
                            .firstWhere((cycleExercise) =>
                                cycleExercise.uuid == exercise?.uuid)
                            .trainingMax = num.parse(value);
                        cycle.save();
                      } else {
                        cycle.exercises
                            .firstWhere((cycleExercise) =>
                                cycleExercise.uuid == exercise?.uuid)
                            .trainingMax = 0;
                      }
                    },
                  ),
                ),
                const SizedBox(height: 10),
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
            ),
          );
        },
      ),
    );
  }
}
