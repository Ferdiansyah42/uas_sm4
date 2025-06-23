import 'package:flutter/material.dart';

class TransferPage extends StatelessWidget {
  const TransferPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> daftarNama = ['Aldi', 'Budi', 'Rudi', 'Rendi', 'Suradi'];
    return Scaffold(
      backgroundColor: const Color(0xFFEAF2FF),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 109, 68, 180),
        title: const Text(
          'Transfer Uang',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [

          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Transfer Cepat',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Cari nomor telepon/rekening bank',
                    prefixIcon: const Icon(Icons.search),
                    filled: true,
                    fillColor: const Color(0xFFF0F0F0),
                    contentPadding: const EdgeInsets.symmetric(vertical: 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(daftarNama.length, (index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 28,
                              backgroundImage: const AssetImage('assets/profil.png'),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              daftarNama[index],
                              style: const TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Wrap(
              spacing: 24,
              runSpacing: 24,
              alignment: WrapAlignment.center,
              children: [
                _buildMenuItem(Icons.group_add, 'Transfer ke\nGrup'),
                _buildMenuItem(Icons.person, 'Transfer ke\nTeman'),
                _buildMenuItem(Icons.account_balance, 'Transfer ke\nBank'),
                _buildMenuItem(Icons.account_balance_wallet, 'Kirim ke\ne-Wallet'),
                _buildMenuItem(Icons.confirmation_number, 'Transfer Kode\nTunai'),
                _buildMenuItem(Icons.money, 'Tarik\nTunai'),
                _buildMenuItem(Icons.mail, 'DANA\nKaget'),
                _buildMenuItem(Icons.send, 'Transfer ke\nChat'),
                _buildMenuItem(Icons.qr_code, 'Scan\nKode QR'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String label) {
    return SizedBox(
      width: 80,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 32,
            backgroundColor: Colors.blue[100],
            child: Icon(icon, color: Colors.blue[800], size: 30),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(fontSize: 13),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
