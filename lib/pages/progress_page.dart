import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:nsuns/data/Boxes.dart';
import 'package:nsuns/data/TrainingMax.dart';

class ProgressPage extends StatefulWidget {
  const ProgressPage({super.key});
  static const routeName = '/progress';

  @override
  State<ProgressPage> createState() => _ProgressPageState();
}

class _ProgressPageState extends State<ProgressPage> {
  @override
  Widget build(BuildContext context) {
    Map colours = {
      "Bench Press": Colors.blue,
      "Squat": Colors.deepOrange,
      "Deadlift": Colors.green,
      "Overhead Press": Colors.deepPurple,
    };
    return Scaffold(
      appBar: AppBar(
        title: const Text("Progress"),
      ),
      body: Center(
        child: LineChart(
          LineChartData(
            lineBarsData: [
              ...Boxes.getExercises()
                  .values
                  .where((exercise) => !exercise.isAssistanceExcercise)
                  .map(
                    (exercise) => LineChartBarData(
                      spots: exercise.trainingMaxData.asMap().entries
                          // .where((entry) => entry.key != 0)
                          .map(
                        (entry) {
                          int index = entry.key;
                          print(index);
                          TrainingMax trainingMax = entry.value;

                          return FlSpot(
                            index.toDouble(),
                            trainingMax.trainingMax.toDouble(),
                          );
                        },
                      ).toList(),
                      isCurved: true,
                      dotData: FlDotData(
                        show: false,
                      ),
                      color: colours[exercise.name] ?? Colors.red,
                    ),
                  )
                  .toList(),
            ],
          ),
        ),
      ),
    );
  }
}
