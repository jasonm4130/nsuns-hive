import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:nsuns/components/cycle_tile.dart';
import 'package:nsuns/components/navigation_drawer.dart';
import 'package:nsuns/data/Cycle.dart';
import 'package:nsuns/pages/setup_page.dart';
import 'package:nsuns/utils/consts.dart';
import 'package:nsuns/utils/start_of_week.dart';
import 'package:uuid/uuid.dart';

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

  final cycle = Cycle()
    ..uuid = uuid
    ..startDate = startOfWeek()
    ..exercises = Boxes.getExercises().values.toList()
    ..days = templates[template]();

  // Get the cycles box
  final box = Boxes.getCycles();
  return box.put(uuid, cycle);
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
          final cycles = box.values.toList().cast<Cycle>();

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
