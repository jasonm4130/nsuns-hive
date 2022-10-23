import 'package:flutter/material.dart';
import 'package:nsuns/components/settings_section.dart';
import 'package:nsuns/data/Boxes.dart';
import 'package:nsuns/pages/setup_page.dart';
import 'package:nsuns/utils/decorators.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});
  static const routeName = '/settings';

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Form(
              key: _formKey,
              child: ValueListenableBuilder(
                valueListenable: Boxes.getSettings().listenable(),
                builder: (context, box, _) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SettingsSection(
                          progression: Boxes.getSetting(key: 'progression'),
                          rounding: Boxes.getSetting(key: 'rounding'),
                          units: Boxes.getSetting(key: 'units'),
                          template: Boxes.getSetting(key: 'template'),
                          setProgression: (value) {
                            Boxes.updateSetting(
                              key: 'progression',
                              value: value,
                            );
                          },
                          setRounding: (value) {
                            if (num.tryParse(value) != null) {
                              Boxes.updateSetting(
                                key: 'rounding',
                                value: num.parse(value),
                              );
                            }
                          },
                          setUnits: (value) {
                            Boxes.updateSetting(
                              key: 'units',
                              value: value,
                            );
                          },
                          setTemplate: (value) {
                            Boxes.updateSetting(
                              key: 'template',
                              value: value,
                            );
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
              onChanged: () {
                // Validate the form
                _formKey.currentState!.validate();
              },
            ),
            const SizedBox(height: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Reset All Data!',
                  style: headingStyle,
                ),
                const SizedBox(height: 10),
                const Text(
                    'This will reset all currently saved data and return you to the setup page. There is no way to restore data after you press this button'),
                const SizedBox(height: 10),
                MaterialButton(
                  color: Colors.red,
                  textColor: Colors.white,
                  onPressed: () {
                    // Clear the hive boxes
                    Boxes.getCycles().clear();
                    Boxes.getExercises().clear();
                    // Go back to the setup page because there is no data
                    Navigator.pushNamed(context, SetupPage.routeName);
                  },
                  child: const Text('Reset All Data'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
