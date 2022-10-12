import 'package:flutter/material.dart';
import 'package:nsuns/data/Cycle.dart';
import 'package:nsuns/pages/cycle_page.dart';
import 'package:nsuns/pages/home_page.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:nsuns/pages/settings_page.dart';
import 'package:nsuns/pages/setup_page.dart';

import 'data/Excercise.dart';
import 'data/Set.dart';

void main() async {
  // Init hive
  await Hive.initFlutter();

  // Import the adaptors needed for Hive
  Hive.registerAdapter(CycleAdapter());
  Hive.registerAdapter(ExcerciseAdapter());
  Hive.registerAdapter(SetAdapter());

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
        SettingsPage.routeName: (context) => const SettingsPage(),
        SetupPage.routeName: (context) => const SetupPage(),
      },
    );
  }
}
