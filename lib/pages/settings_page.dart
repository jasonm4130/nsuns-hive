import 'package:flutter/material.dart';
import 'package:nsuns/data/Database.dart';
import 'package:nsuns/pages/setup_page.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});
  static const routeName = '/settings';

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MaterialButton(
              color: Colors.red,
              textColor: Colors.white,
              onPressed: () {
                NsunsDataBase.excercises = [];
                NsunsDataBase.updateDataBase();
                Navigator.pushNamed(context, SetupPage.routeName);
              },
              child: const Text('Reset'),
            ),
          ],
        ),
      ),
    );
  }
}
