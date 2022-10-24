import 'package:flutter/material.dart';
import 'package:nsuns/components/exercise_tile.dart';
import 'package:nsuns/data/Boxes.dart';
import 'package:nsuns/data/Cycle.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:nsuns/utils/decorators.dart';

class CyclePage extends StatefulWidget {
  const CyclePage({super.key});
  static const routeName = '/cycles';
  @override
  State<CyclePage> createState() => _CyclePageState();
}

class _CyclePageState extends State<CyclePage> {
  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;

    return ValueListenableBuilder<Box<Cycle>>(
      valueListenable: Boxes.getCycles().listenable(),
      builder: (context, box, _) {
        final Cycle cycle = Boxes.getCycle(
          key: arguments['cycleId'],
        );

        return DefaultTabController(
          length: cycle.days.length,
          child: Scaffold(
            appBar: AppBar(
              title: Text(cycle.getStartDateFormatted()),
            ),
            body: Column(
              children: [
                TabBar(
                  tabs: [
                    ...cycle.days.asMap().entries.map(
                          (day) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Day ${day.key}',
                              style: tabStyle,
                            ),
                          ),
                        ),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      ...cycle.days.map(
                        (day) => SingleChildScrollView(
                          child: Container(
                            padding: itemPadding,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 10),
                                const Text(
                                  'Exercises',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                ExerciseTile(
                                  exerciseId: day.tOneExerciseId,
                                  exerciseType: 'tOne',
                                  sets: day.tOneSets,
                                  day: day,
                                  cycle: cycle,
                                ),
                                ExerciseTile(
                                  exerciseId: day.tTwoExerciseId,
                                  exerciseType: 'tTwo',
                                  sets: day.tTwoSets,
                                  day: day,
                                  cycle: cycle,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
