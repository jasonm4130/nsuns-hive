import 'package:flutter/material.dart';
import 'package:nsuns/data/Cycle.dart';
import 'package:nsuns/pages/cycle_page.dart';
import 'package:nsuns/pages/home_page.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  // Init hive
  await Hive.initFlutter();

  Hive.registerAdapter(CycleAdapter());

  // Open our hive box
  await Hive.openBox('nsuns_database');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      initialRoute: '/',
      routes: {
        HomePage.routeName: (context) => const HomePage(title: 'Nsuns 5/3/1'),
        CyclePage.routeName: (context) => const CyclePage(),
      },
    );
  }
}
