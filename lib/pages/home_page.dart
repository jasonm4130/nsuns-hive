import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:nsuns/components/cycle_tile.dart';
import 'package:nsuns/components/navigation_drawer.dart';
import 'package:nsuns/data/Cycle.dart';
import 'package:nsuns/data/Set.dart';
import 'package:nsuns/data/TrainingMax.dart';
import 'package:nsuns/pages/setup_page.dart';
import 'package:nsuns/utils/consts.dart';
import 'package:nsuns/utils/start_of_week.dart';
import 'package:uuid/uuid.dart';
import 'package:collection/collection.dart';
import '../data/Boxes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  static const routeName = '/';
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

Future addCycle() {
  final String template = Boxes.getSetting(key: 'template');
  final String uuid = const Uuid().v4();

  // Get the cycles box
  final cycles = Boxes.getCycles();
  final exercises = Boxes.getExercises();

  // Because the boxes are a key value pair we can get the most recent cycle from the box
  Cycle? lastCycle;
  if (cycles.length > 0) {
    // Get the list of cycles
    lastCycle = cycles.values.toList().first;
  }

  // If there was a last cycle then we want to check if the execrcises were completed and progress if needed
  if (lastCycle != null) {
    // Loop through all our exercises
    for (var exercise in exercises.values) {
      // Loop through our last cycle days
      List<Set> exerciseSets = [];
      for (var day in lastCycle.days) {
        if (day.tOneExerciseId == exercise.uuid ||
            day.tOneExerciseId == exercise.assistanceExcerciseId) {
          exerciseSets = [...exerciseSets, ...day.tOneSets];
        }
        if (day.tTwoExerciseId == exercise.uuid ||
            day.tTwoExerciseId == exercise.assistanceExcerciseId) {
          exerciseSets = [...exerciseSets, ...day.tTwoSets];
        }
      }

      if (exerciseSets.every((set) => set.isComplete) &&
          exerciseSets
              .where((set) => set.isAmrap)
              .every((set) => set.repsCompleted >= set.reps) &&
          !exercise.isAssistanceExcercise) {
        // Get the amrap sets that has a target of 1
        Set? progressionSet = exerciseSets.firstWhereOrNull(
          (set) => set.isAmrap && set.reps == 1,
        );

        // Update the training max based on the progression scheme
        Map progression = Boxes.getSetting(key: 'progression');

        if (progressionSet != null) {
          // Get the key for the ammount we should progress
          String progressionKey = progression.keys.firstWhere(
            (key) => key.contains(progressionSet.repsCompleted.toString()),
            orElse: () => "6+",
          );

          // Add the progression to the exercise and save it
          exercise.trainingMaxData.add(
            TrainingMax()
              ..date = startOfWeek()
              ..trainingMax = exercise.trainingMaxData.last.trainingMax +
                  progression[progressionKey]
              ..linkedCycleUuid = uuid,
          );
        } else {
          // If there is no progression set, we should progress the exercise by the minimum progression set
          exercise.trainingMaxData.add(
            TrainingMax()
              ..date = startOfWeek()
              ..trainingMax = exercise.trainingMaxData.last.trainingMax +
                  progression.values
                      .firstWhere((ammountToProgress) => ammountToProgress > 0)
              ..linkedCycleUuid = uuid,
          );
        }
        exercise.save();
      }
    }
  } else {
    // If there is no last cycle (because this is the first cycle to be added)
    for (var exercise in exercises.values) {
      if (exercise.trainingMaxData.isNotEmpty) {
        TrainingMax newTrainingMaxInstance = TrainingMax()
          ..date = startOfWeek()
          ..trainingMax = exercise.trainingMaxData.last.trainingMax
          ..linkedCycleUuid = uuid;
        exercise.trainingMaxData.add(newTrainingMaxInstance);
        exercise.save();
      }
    }
  }

  final cycle = Cycle()
    ..uuid = uuid
    ..startDate = startOfWeek()
    ..days = templates[template]();

  return cycles.put(uuid, cycle);
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // Call the method
    super.initState();

    // Show the setup after build if we don't have excercises
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // if after trying to load excercises there are still none, navigate to the setup screen
      if (Boxes.getExercises().isEmpty) {
        Navigator.pushNamed(
          context,
          SetupPage.routeName,
        );
      }
    });
  }

  @override
  void dispose() {
    Hive.box('cycles').close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: const NavigationDrawer(),
      body: ValueListenableBuilder<Box<Cycle>>(
        valueListenable: Boxes.getCycles().listenable(),
        builder: (context, box, _) {
          final cycles = box.values.toList();
          cycles.sort(
            (a, b) => b.startDate.compareTo(a.startDate),
          );

          return Center(
            child: Column(
              children: [...cycles.map((cycle) => CycleTile(cycle: cycle))],
            ),
          );
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: const [
          FloatingActionButton(
            onPressed: addCycle,
            tooltip: 'Add Cycle',
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
