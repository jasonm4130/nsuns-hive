import 'package:flutter/material.dart';
import 'package:nsuns/components/navigation_drawer.dart';
import 'package:nsuns/data/Database.dart';
import '../data/Cycle.dart';

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
    final cycleUuid = arguments['cycleUuid'];
    final Cycle cycle =
        NsunsDataBase.cycles.firstWhere((cycle) => cycle.uuid == cycleUuid);
    return Scaffold(
      appBar: AppBar(
        title: Text(cycle.getStartDateFormatted()),
      ),
    );
  }
}
