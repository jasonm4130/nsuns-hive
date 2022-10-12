import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SetupPage extends StatefulWidget {
  const SetupPage({super.key});
  static const routeName = '/setup';

  @override
  State<SetupPage> createState() => _SetupPageState();
}

class _SetupPageState extends State<SetupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Setup'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          children: [Text('Setup')],
        ),
      ),
    );
  }
}
