import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool isDarkModeEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEAF2FF),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const SizedBox(height: 20),

            Center(
              child: CircleAvatar(
                radius: 45,
                backgroundColor: Colors.transparent,
                child: ClipOval(
                  child: Image.asset(
                    'assets/profil.png',
                    width: 90,
                    height: 90,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),

            // Nama
            const Center(
              child: Text(
                'Ferdi',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
            ),

            const SizedBox(height: 20),
            const Divider(thickness: 1),
            const SizedBox(height: 10),

            ListTile(
              leading: const Icon(Icons.person, color: Colors.black),
              title: const Text(
                'Pengaturan Profil',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.history, color: Colors.black),
              title: const Text(
                'History Transaction',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              onTap: () {},
            ),

            SwitchListTile(
              secondary: const Icon(Icons.dark_mode, color: Colors.black),
              title: const Text(
                'Mode Gelap',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              value: isDarkModeEnabled,
              onChanged: (val) {
                setState(() {
                  isDarkModeEnabled = val;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
