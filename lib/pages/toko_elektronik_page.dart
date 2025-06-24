import 'package:flutter/material.dart';

class TokoElektronikPage extends StatelessWidget {
  const TokoElektronikPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Toko Elektronik',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        automaticallyImplyLeading: false,
      ),
      body: const Center(
        child: Text(
          'Ini halaman Toko Elektronik',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
