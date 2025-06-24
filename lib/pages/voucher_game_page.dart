import 'package:flutter/material.dart';

class VoucherGamePage extends StatelessWidget {
  const VoucherGamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Voucher Game',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        automaticallyImplyLeading: false,
      ),
      body: const Center(
        child: Text(
          'Ini halaman Voucher Game',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
