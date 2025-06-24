import 'package:flutter/material.dart';

class CuacaPage extends StatelessWidget {
  const CuacaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cuaca',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        automaticallyImplyLeading: false,
      ),
      body: const Center(
        child: Text(
          'Ini halaman Cuaca',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
