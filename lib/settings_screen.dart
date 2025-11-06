import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _darkMode = false;
  bool _notifications = true;
  bool _sound = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Colors.deepPurple,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Center(
            child: Column(
              children: [
                Icon(Icons.settings, size: 70, color: Colors.deepPurple),
                SizedBox(height: 10),
                Text(
                  "App Settings",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          SwitchListTile(
            title: const Text("Dark Mode"),
            subtitle: const Text("Enable dark theme for app"),
            value: _darkMode,
            activeColor: Colors.deepPurple,
            onChanged: (val) => setState(() => _darkMode = val),
          ),
          const Divider(),
          SwitchListTile(
            title: const Text("Notifications"),
            subtitle: const Text("Get daily quiz reminders"),
            value: _notifications,
            activeColor: Colors.deepPurple,
            onChanged: (val) => setState(() => _notifications = val),
          ),
          const Divider(),
          SwitchListTile(
            title: const Text("Sound Effects"),
            subtitle: const Text("Play sound when answering quizzes"),
            value: _sound,
            activeColor: Colors.deepPurple,
            onChanged: (val) => setState(() => _sound = val),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.info_outline, color: Colors.deepPurple),
            title: const Text("About MyQuiz"),
            subtitle: const Text("Version 1.0.0 • Made with ❤️ in India"),
            onTap: () {
              showAboutDialog(
                context: context,
                applicationName: "MyQuiz",
                applicationVersion: "1.0.0",
                children: [
                  const Text("An interactive learning app with fun quizzes."),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
