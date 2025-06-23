import 'package:flutter/material.dart';

class TopUpPage extends StatefulWidget {
  const TopUpPage({super.key});

  @override
  State<TopUpPage> createState() => _TopUpPageState();
}

class _TopUpPageState extends State<TopUpPage> {
  String? selectedAmount;
  String? selectedMethod;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEAF2FF),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 109, 68, 180),
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text(
          'Top Up',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [

          // === Container 1: Nominal Top Up ===
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 5,
                  offset: const Offset(0, 2),
                )
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Top Up Saldo',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Pilih Nominal Top Up',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 12),

                LayoutBuilder(
                  builder: (context, constraints) {
                    double spacing = 12;
                    double itemWidth = (constraints.maxWidth - spacing * 2) / 3;
                    List<String> amounts = [
                      'Rp 50.000',
                      'Rp 100.000',
                      'Rp 200.000',
                      'Rp 300.000',
                      'Rp 400.000',
                      'Rp 500.000',
                    ];

                    return Wrap(
                      spacing: spacing,
                      runSpacing: spacing,
                      children: amounts.map((amount) => _buildAmountButton(amount, itemWidth)).toList(),
                    );
                  },
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

        ],
      ),
    );
  }

  Widget _buildAmountButton(String amount, double width) {
    final bool isSelected = selectedAmount == amount;
    return SizedBox(
      width: width,
      child: OutlinedButton(
        onPressed: () {
          setState(() {
            selectedAmount = amount;
          });
        },
        style: OutlinedButton.styleFrom(
          backgroundColor: isSelected ? Colors.deepPurple : Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          side: const BorderSide(color: Colors.deepPurple),
        ),
        child: Text(
          amount,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.deepPurple,
          ),
        ),
      ),
    );
  }
}
