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
                  'Metode Pembayaran',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                _buildMethodTile('E-Wallet', 'Gopay, OVO, Dana', Icons.account_balance_wallet),
                const SizedBox(height: 8),
                _buildMethodTile('Transfer Bank', 'BCA, BRI, Mandiri', Icons.account_balance),
              ],
            ),
          ),

          const SizedBox(height: 24),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                if (selectedAmount != null && selectedMethod != null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Top up $selectedAmount via $selectedMethod (belum tersedia)'),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Pilih nominal dan metode pembayaran')),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text('Lanjutkan', style: TextStyle(fontSize: 16, color: Colors.white)),
            ),
          ),
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

  Widget _buildMethodTile(String title, String subtitle, IconData icon) {
    final bool isSelected = selectedMethod == title;
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? Colors.deepPurple.withOpacity(0.1) : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Icon(icon, color: isSelected ? Colors.deepPurple : Colors.black54),
        title: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.deepPurple : Colors.black87,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        subtitle: Text(subtitle),
        onTap: () {
          setState(() {
            selectedMethod = title;
          });
        },
      ),
    );
  }
}
