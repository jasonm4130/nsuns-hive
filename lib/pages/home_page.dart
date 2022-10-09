import 'package:flutter/material.dart';
import 'package:nsuns/components/cycle_tile.dart';
import 'package:nsuns/data/Database.dart';

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

    // Call the method
    super.initState();
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
      body: Center(
        child: Column(
          children: cycleTiles,
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => {NsunsDataBase.addCycle(), refresh()},
            tooltip: 'Add Cycle',
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
