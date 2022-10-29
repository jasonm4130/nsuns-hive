import 'package:flutter/material.dart';
import 'package:nsuns/data/Cycle.dart';
import 'package:nsuns/data/Day.dart';
import 'package:nsuns/data/Exercise.dart';
import 'package:nsuns/data/Set.dart';
import 'package:nsuns/data/TrainingMax.dart';
import 'package:nsuns/pages/cycle_page.dart';
import 'package:nsuns/pages/exercise_page.dart';
import 'package:nsuns/pages/home_page.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:nsuns/pages/settings_page.dart';
import 'package:nsuns/pages/setup_page.dart';

void main() async {
  // Init hive
  await Hive.initFlutter();

  // Import the adaptors needed for Hive
  Hive.registerAdapter(CycleAdapter());
  Hive.registerAdapter(ExerciseAdapter());
  Hive.registerAdapter(SetAdapter());
  Hive.registerAdapter(DayAdapter());
  Hive.registerAdapter(TrainingMaxAdapter());

  // Open our hive box
  await Hive.openBox<Cycle>('cycles');
  await Hive.openBox<Exercise>('exercises');
  await Hive.openBox('settings');

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
        ExercisePage.routeName: (context) => const ExercisePage(),
      },
    );
  }
}
