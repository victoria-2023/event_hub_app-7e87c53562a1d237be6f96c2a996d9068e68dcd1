import 'package:flutter/material.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF2EE), // Keep background color consistent with the rest of the app
      appBar: AppBar(
        title: const Text('Settings', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.notifications, color: Colors.black),
            title: const Text('Notifications'),
            subtitle: const Text('Manage your notifications settings'),
            onTap: () {
              // Handle notifications settings tap
            },
          ),
          ListTile(
            leading: const Icon(Icons.lock_outline, color: Colors.black),
            title: const Text('Privacy'),
            subtitle: const Text('Privacy and security settings'),
            onTap: () {
              // Handle privacy settings tap
            },
          ),
          ListTile(
            leading: const Icon(Icons.palette, color: Colors.black),
            title: const Text('Theme'),
            subtitle: const Text('Customize app theme'),
            onTap: () {
              // Handle theme settings tap
            },
          ),
          ListTile(
            leading: const Icon(Icons.language, color: Colors.black),
            title: const Text('Language'),
            subtitle: const Text('Change language'),
            onTap: () {
              // Handle language settings tap
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.black),
            title: const Text('Log out'),
            onTap: () {
              // Log out and navigate to welcome screen
              Navigator.pushNamedAndRemoveUntil(context, '/', (Route<dynamic> route) => false);
            },
          ),
        ],
      ),
    );
  }
}
