import 'package:flutter/material.dart';
import 'package:nsuns/data/Boxes.dart';
import 'package:nsuns/data/Cycle.dart';

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
    final Cycle? cycle = Boxes.getCycle(arguments['cycleId']);
    return Scaffold(
      appBar: AppBar(
        title: Text(cycle?.getStartDateFormatted()),
      ),
    );
  }
}
