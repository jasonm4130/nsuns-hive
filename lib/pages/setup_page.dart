import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nsuns/data/Boxes.dart';
import 'package:nsuns/data/Exercise.dart';
import 'package:nsuns/pages/home_page.dart';
import 'package:nsuns/utils/decimal_text_input_formatter.dart';
import 'package:uuid/uuid.dart';

class SetupPage extends StatefulWidget {
  const SetupPage({super.key});
  static const routeName = '/setup';

  @override
  State<SetupPage> createState() => SetupPageState();
}

TextStyle headingStyle = const TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.bold,
);

InputDecoration dropdownDecorator({String? labelText}) => InputDecoration(
      border: const OutlineInputBorder(),
      labelText: labelText,
      contentPadding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
    );

InputDecoration textFieldDecorator({String? labelText}) => InputDecoration(
      labelText: labelText,
      border: const OutlineInputBorder(),
      contentPadding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
    );

class UnitsSection extends StatelessWidget {
  final String units;
  final num? rounding;
  final Function setUnits;
  final Function setRounding;
  const UnitsSection({
    required this.units,
    required this.rounding,
    required this.setUnits,
    required this.setRounding,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Units & Rounding',
          style: headingStyle,
        ),
        const SizedBox(height: 10),
        DropdownButtonFormField<String>(
          decoration: dropdownDecorator(labelText: 'Units'),
          isExpanded: true,
          items: const [
            DropdownMenuItem(
              value: 'kg',
              child: Text('kg'),
            ),
            DropdownMenuItem(
              value: 'lb',
              child: Text('lb'),
            ),
          ],
          value: units,
          onChanged: (value) {
            setUnits(value);
          },
          onSaved: (newValue) {
            setUnits(newValue);
          },
        ),
        const SizedBox(height: 10),
        DropdownButtonFormField<String>(
          decoration: dropdownDecorator(labelText: 'Rounding'),
          isExpanded: true,
          items: const [
            DropdownMenuItem(
              value: '1.25',
              child: Text('1.25'),
            ),
            DropdownMenuItem(
              value: '2.5',
              child: Text('2.5'),
            ),
            DropdownMenuItem(
              value: '5',
              child: Text('5'),
            ),
          ],
          value: rounding.toString(),
          onChanged: (value) {
            setRounding(value);
          },
          onSaved: (newValue) {
            setRounding(newValue);
          },
        ),
      ],
    );
  }
}

class ExerciseSection extends StatelessWidget {
  final String title;
  final List<String> accessoryOptions;
  final num? trainingMax;
  final String? accessoryName;
  final num? scaleFactor;
  final Function setTrainingMax;
  final Function setAccessoryName;
  final Function setScaleFactor;
  const ExerciseSection({
    required this.title,
    required this.accessoryOptions,
    required this.trainingMax,
    required this.accessoryName,
    required this.scaleFactor,
    required this.setTrainingMax,
    required this.setAccessoryName,
    required this.setScaleFactor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: headingStyle),
        const SizedBox(height: 10),
        TextFormField(
          decoration: textFieldDecorator(labelText: "$title TM"),
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          initialValue: trainingMax?.toString(),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a training max';
            }
            return null;
          },
          onChanged: (value) {
            setTrainingMax(value);
          },
          onSaved: (newValue) {
            setTrainingMax(newValue);
          },
        ),
        const SizedBox(
          height: 10,
        ),
        DropdownButtonFormField<String>(
          decoration: dropdownDecorator(labelText: '$title Accessory'),
          isExpanded: true,
          items: [
            ...accessoryOptions.map(
              (option) => DropdownMenuItem(
                value: option,
                child: Text(option),
              ),
            ),
          ],
          value: accessoryOptions[0],
          onChanged: (value) {
            setAccessoryName(value);
          },
          onSaved: (newValue) {
            setAccessoryName(newValue);
          },
        ),
        const SizedBox(height: 10),
        TextFormField(
          decoration:
              textFieldDecorator(labelText: '$title Accessory Scale Factor'),
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          inputFormatters: [
            DecimalTextInputFormatter(decimalRange: 2),
          ],
          initialValue: scaleFactor?.toString(),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a scale factor';
            }
            return null;
          },
          onChanged: (value) {
            setScaleFactor(value);
          },
          onSaved: (newValue) {
            setScaleFactor(newValue);
          },
        ),
      ],
    );
  }
}

class SetupPageState extends State<SetupPage> {
  num? benchTM;
  num? squatTM;
  num? deadliftTM;
  num? overheadPressTM;
  String? benchAccessoryName = 'Close Grip Bench';
  String? squatAccessoryName = 'Front Squat';
  String? deadliftAccessoryName = 'Sumo Deadlift';
  String? overheadPressAccessoryName = 'Incline Bench';
  num? benchScaleFactor = 0.65;
  num? squatScaleFactor = 0.65;
  num? deadliftScaleFactor = 0.65;
  num? overheadPressScaleFactor = 0.65;
  String units = "kg";
  num? rounding = 2.5;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setup'),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UnitsSection(
                    units: units,
                    rounding: rounding,
                    setUnits: (value) {
                      units = value;
                    },
                    setRounding: (value) {
                      rounding = num.tryParse(value);
                    },
                  ),
                  const SizedBox(height: 20),
                  ExerciseSection(
                    title: 'Bench',
                    accessoryOptions: const [
                      'Close Grip Bench',
                      'Paused Bench',
                      'Dumbbell Bench',
                      'Dips',
                      'Pull Ups'
                    ],
                    trainingMax: benchTM,
                    accessoryName: benchAccessoryName,
                    scaleFactor: benchScaleFactor,
                    setTrainingMax: (value) {
                      benchTM = num.tryParse(value);
                    },
                    setAccessoryName: (value) {
                      benchAccessoryName = value;
                    },
                    setScaleFactor: (value) {
                      benchScaleFactor = num.tryParse(value);
                    },
                  ),
                  const SizedBox(height: 20),
                  ExerciseSection(
                    title: 'Squat',
                    accessoryOptions: const [
                      'Front Squats',
                      'Romanian Deadlifts',
                      'Leg Press',
                      'Good Mornings'
                    ],
                    trainingMax: squatTM,
                    accessoryName: squatAccessoryName,
                    scaleFactor: squatScaleFactor,
                    setTrainingMax: (value) {
                      squatTM = num.tryParse(value);
                    },
                    setAccessoryName: (value) {
                      squatAccessoryName = value;
                    },
                    setScaleFactor: (value) {
                      squatScaleFactor = num.tryParse(value);
                    },
                  ),
                  const SizedBox(height: 20),
                  ExerciseSection(
                    title: 'Deadlift',
                    accessoryOptions: const [
                      'Sumo Deadlift',
                      'Kroc Rows',
                      'Snatch Grip Deadlift',
                      'Deficite Deadlift'
                    ],
                    trainingMax: deadliftTM,
                    accessoryName: deadliftAccessoryName,
                    scaleFactor: deadliftScaleFactor,
                    setTrainingMax: (value) {
                      deadliftTM = num.tryParse(value);
                    },
                    setAccessoryName: (value) {
                      deadliftAccessoryName = value;
                    },
                    setScaleFactor: (value) {
                      deadliftScaleFactor = num.tryParse(value);
                    },
                  ),
                  const SizedBox(height: 20),
                  ExerciseSection(
                    title: 'Overhead Press',
                    accessoryOptions: const [
                      'Incline Bench',
                      'Dumbbell Should Press',
                      'Landmine Press',
                      'Viking Press'
                    ],
                    trainingMax: overheadPressTM,
                    accessoryName: overheadPressAccessoryName,
                    scaleFactor: overheadPressScaleFactor,
                    setTrainingMax: (value) {
                      overheadPressTM = num.tryParse(value);
                    },
                    setAccessoryName: (value) {
                      overheadPressAccessoryName = value;
                    },
                    setScaleFactor: (value) {
                      overheadPressScaleFactor = num.tryParse(value);
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      MaterialButton(
                        color: Colors.red,
                        textColor: Colors.white,
                        onPressed: () {
                          // If is Valid
                          if (_formKey.currentState!.validate()) {
                            // Get our uuids for each exercise
                            final benchUuid = const Uuid().v4();
                            final squatUuid = const Uuid().v4();
                            final deadliftUuid = const Uuid().v4();
                            final overheadPressUuid = const Uuid().v4();
                            final benchAccessoryUuid = const Uuid().v4();
                            final squatAccessoryUuid = const Uuid().v4();
                            final deadliftAccessoryUuid = const Uuid().v4();
                            final overheadPressAccessoryUuid =
                                const Uuid().v4();

                            // Add the default excercises to our box
                            // Get our box
                            final box = Boxes.getExercises();

                            // Do a null check on our TM's before we try and add the excercises
                            if (benchTM != null &&
                                squatTM != null &&
                                deadliftTM != null &&
                                overheadPressTM != null &&
                                benchScaleFactor != null &&
                                squatScaleFactor != null &&
                                deadliftScaleFactor != null &&
                                overheadPressScaleFactor != null) {
                              // Setup our excercise objects before putting them in the box
                              // Bench
                              Exercise benchAccessoryExercise = Exercise()
                                ..uuid = benchAccessoryUuid
                                ..isAssistanceExcercise = true
                                ..name = benchAccessoryName.toString()
                                ..trainingMax = benchTM! * benchScaleFactor!
                                ..assistanceExcercise = null
                                ..estimatedOneRepMax = null;

                              Exercise bench = Exercise()
                                ..uuid = benchUuid
                                ..name = 'Bench Press'
                                ..trainingMax = benchTM!
                                ..isAssistanceExcercise = false
                                ..assistanceExcercise = benchAccessoryExercise
                                ..estimatedOneRepMax = benchTM! / 0.85;

                              // Squat
                              Exercise squatAccessoryExercise = Exercise()
                                ..uuid = squatAccessoryUuid
                                ..isAssistanceExcercise = true
                                ..name = squatAccessoryName.toString()
                                ..trainingMax = squatTM! * squatScaleFactor!
                                ..assistanceExcercise = null
                                ..estimatedOneRepMax = null;

                              Exercise squat = Exercise()
                                ..uuid = squatUuid
                                ..name = 'Squat'
                                ..trainingMax = squatTM!
                                ..isAssistanceExcercise = false
                                ..assistanceExcercise = squatAccessoryExercise
                                ..estimatedOneRepMax = squatTM! / 0.85;

                              // Deadlift
                              Exercise deadliftAccessoryExercise = Exercise()
                                ..uuid = deadliftAccessoryUuid
                                ..isAssistanceExcercise = true
                                ..name = deadliftAccessoryName.toString()
                                ..trainingMax =
                                    deadliftTM! * deadliftScaleFactor!
                                ..assistanceExcercise = null
                                ..estimatedOneRepMax = null;

                              Exercise deadlift = Exercise()
                                ..uuid = deadliftUuid
                                ..name = 'Deadlift'
                                ..trainingMax = deadliftTM!
                                ..isAssistanceExcercise = false
                                ..assistanceExcercise =
                                    deadliftAccessoryExercise
                                ..estimatedOneRepMax = deadliftTM! * 0.85;

                              // Overhead Press
                              Exercise overheadPressAccessoryExercise =
                                  Exercise()
                                    ..uuid = overheadPressAccessoryUuid
                                    ..isAssistanceExcercise = true
                                    ..name =
                                        overheadPressAccessoryName.toString()
                                    ..trainingMax = overheadPressTM! *
                                        overheadPressScaleFactor!
                                    ..assistanceExcercise = null
                                    ..estimatedOneRepMax = null;

                              Exercise overheadPress = Exercise()
                                ..uuid = overheadPressUuid
                                ..name = 'Overhead Press'
                                ..trainingMax = overheadPressTM!
                                ..isAssistanceExcercise = false
                                ..assistanceExcercise =
                                    overheadPressAccessoryExercise
                                ..estimatedOneRepMax = overheadPressTM! / 0.85;

                              // Put our excercises into the box
                              box.putAll({
                                benchUuid: bench,
                                squatUuid: squat,
                                deadliftUuid: deadlift,
                                overheadPressUuid: overheadPress,
                              });

                              // After adding the excercises navigate to the home screen
                              Navigator.pushNamed(context, HomePage.routeName);
                            }
                          }
                        },
                        child: const Text('Save'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
