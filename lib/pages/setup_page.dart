import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nsuns/data/Database.dart';
import 'package:nsuns/data/Excercise.dart';
import 'package:nsuns/pages/home_page.dart';

class SetupPage extends StatefulWidget {
  const SetupPage({super.key});
  static const routeName = '/setup';

  @override
  State<SetupPage> createState() => _SetupPageState();
}

class _SetupPageState extends State<SetupPage> {
  // Setup our controllers
  final _benchMaxController = TextEditingController();
  final _squatMaxController = TextEditingController();
  final _deadliftMaxController = TextEditingController();
  final _overheadPressMaxController = TextEditingController();

  String benchAccessoryName = 'Close Grip Bench';
  String squatAccessoryName = 'Front Squat';
  String deadliftAccessoryName = 'Sumo Deadlift';
  String overheadPressAccessoryName = 'Incline Bench';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setup'),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Bench',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _benchMaxController,
                decoration: const InputDecoration(
                  labelText: "Bench 1 Rep Max",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              ),
              const SizedBox(
                height: 10,
              ),
              InputDecorator(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    items: const [
                      DropdownMenuItem(
                        value: 'Close Grip Bench',
                        child: Text('Close Grip Bench'),
                      ),
                      DropdownMenuItem(
                        value: 'Dumbbell Bench',
                        child: Text('Dumbbell Bench'),
                      ),
                      DropdownMenuItem(
                        value: 'Incline Bench',
                        child: Text('Inclinde Bench'),
                      ),
                      DropdownMenuItem(
                        value: 'Pull Up',
                        child: Text('Pull Up'),
                      ),
                    ],
                    value: 'Close Grip Bench',
                    onChanged: (value) {
                      if (value != null) {
                        benchAccessoryName = value;
                      }
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Squat',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _squatMaxController,
                decoration: const InputDecoration(
                  labelText: "Squat 1 Rep Max",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              ),
              const SizedBox(height: 10),
              InputDecorator(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    items: const [
                      DropdownMenuItem(
                        value: 'Front Squat',
                        child: Text('Front Squat'),
                      ),
                      DropdownMenuItem(
                        value: 'Romanian Deadlift',
                        child: Text('Romanian Deadlift'),
                      ),
                      DropdownMenuItem(
                        value: 'Good Morning',
                        child: Text('Good Morning'),
                      ),
                      DropdownMenuItem(
                        value: 'Leg Press',
                        child: Text('Leg Press'),
                      ),
                    ],
                    value: 'Front Squat',
                    onChanged: (value) {
                      if (value != null) {
                        squatAccessoryName = value;
                      }
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Deadlift',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _deadliftMaxController,
                decoration: const InputDecoration(
                  labelText: "Deadlift 1 Rep Max",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              ),
              const SizedBox(height: 10),
              InputDecorator(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    items: const [
                      DropdownMenuItem(
                        value: 'Sumo Deadlift',
                        child: Text('Sumo Deadlift'),
                      ),
                      DropdownMenuItem(
                        value: 'Snatch Grip Deadlift',
                        child: Text('Snatch Grip Deadlift'),
                      ),
                      DropdownMenuItem(
                        value: 'Deficite Deadlift',
                        child: Text('Deficiate Deadlift'),
                      ),
                    ],
                    value: 'Sumo Deadlift',
                    onChanged: (value) {
                      if (value != null) {
                        deadliftAccessoryName = value;
                      }
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Overhead Press',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _overheadPressMaxController,
                decoration: const InputDecoration(
                  labelText: "Overhead Press 1 Rep Max",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              ),
              const SizedBox(height: 10),
              InputDecorator(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    items: const [
                      DropdownMenuItem(
                        value: 'Inclinde Bench',
                        child: Text('Inclinde Bench'),
                      ),
                      DropdownMenuItem(
                        value: 'Dumbbell Press',
                        child: Text('Dumbbell Press'),
                      ),
                      DropdownMenuItem(
                        value: 'Seated Press',
                        child: Text('Seated Press'),
                      ),
                    ],
                    value: 'Inclinde Bench',
                    onChanged: (value) {
                      if (value != null) {
                        overheadPressAccessoryName = value;
                      }
                    },
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MaterialButton(
                    color: Colors.red,
                    textColor: Colors.white,
                    onPressed: () {
                      // Add each of the default excercises
                      NsunsDataBase.addExcercise(
                        excercise: Excercise(
                            name: 'Bench',
                            estimatedMax:
                                double.parse(_benchMaxController.text),
                            trainingMax:
                                double.parse(_benchMaxController.text) * 0.95),
                      );
                      NsunsDataBase.addExcercise(
                        excercise: Excercise(
                            name: 'Squat',
                            estimatedMax:
                                double.parse(_squatMaxController.text),
                            trainingMax:
                                double.parse(_squatMaxController.text) * 0.95),
                      );
                      NsunsDataBase.addExcercise(
                        excercise: Excercise(
                            name: 'Deadlift',
                            estimatedMax:
                                double.parse(_deadliftMaxController.text),
                            trainingMax:
                                double.parse(_deadliftMaxController.text) *
                                    0.95),
                      );
                      NsunsDataBase.addExcercise(
                        excercise: Excercise(
                            name: 'Overhead Press',
                            estimatedMax:
                                double.parse(_overheadPressMaxController.text),
                            trainingMax:
                                double.parse(_overheadPressMaxController.text) *
                                    0.95),
                      );

                      // After adding the excercises navigate to the home screen
                      Navigator.pushNamed(context, HomePage.routeName);
                    },
                    child: const Text('Save'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
