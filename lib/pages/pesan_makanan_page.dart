import 'package:flutter/material.dart';

class PesanMakananPage extends StatelessWidget {
  const PesanMakananPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Pesan Makanan',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 126, 80, 206),
      ),
      body: const Center(
        child: Text(
          'Ini halaman Pesan Makanan',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
