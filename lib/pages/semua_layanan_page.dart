import 'package:flutter/material.dart';

class SemuaLayananPage extends StatelessWidget {
  const SemuaLayananPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEAF2FF),
      appBar: AppBar(
        title: const Text(
          'Semua Layanan',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        automaticallyImplyLeading: false,
      ),
      body: const Center(
        child: Text(
          'Ini Semua Layanan',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
