import 'package:flutter/material.dart';
import 'package:nsuns/pages/home_page.dart';
import 'package:nsuns/pages/settings_page.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          ListTile(
            leading: const Icon(
              Icons.home,
            ),
            title: const Text('Home'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, HomePage.routeName);
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.insights,
            ),
            title: const Text('Progress'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, SettingsPage.routeName);
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.settings,
            ),
            title: const Text('Settings'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, SettingsPage.routeName);
            },
          ),
        ],
      ),
    );
  }
}
