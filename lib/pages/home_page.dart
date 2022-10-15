import 'package:flutter/material.dart';
import 'package:nsuns/components/cycle_tile.dart';
import 'package:nsuns/components/navigation_drawer.dart';
import 'package:nsuns/data/Database.dart';
import 'package:nsuns/pages/setup_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  static const routeName = '/';
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  refresh() {
    setState(() {});
  }

  @override
  void initState() {
    // If there is nothing in the cycles array
    if (NsunsDataBase.cycles.isEmpty) {
      // Load the cycles data (could be empty still)
      NsunsDataBase.loadCycles();

      // Update the state
      refresh();
    }

    // If we don't have any excercises
    if (NsunsDataBase.excercises.isEmpty) {
      // Try and load the excercises
      NsunsDataBase.loadExcercises();

      // update the state
      refresh();
    }

    // Call the method
    super.initState();

    // Show the setup after build if we don't have excercises
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Add Your Code here.
      // if after trying to load excercises there are still none, navigate to the setup screen
      if (NsunsDataBase.excercises.isEmpty) {
        Navigator.pushNamed(
          context,
          SetupPage.routeName,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> cycleTiles = NsunsDataBase.cycles
        .map((cycle) => CycleTile(
              cycle: cycle,
              key: UniqueKey(),
              refresh: refresh,
            ))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: const NavigationDrawer(),
      body: Center(
        child: Column(
          children: cycleTiles,
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              NsunsDataBase.addCycle();
              refresh();
            },
            tooltip: 'Add Cycle',
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
