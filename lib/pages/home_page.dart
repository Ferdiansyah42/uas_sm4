import 'package:flutter/material.dart';
import 'scan_page.dart';
import 'transfer_page.dart';
import 'terima_page.dart';
import 'top_up_page.dart';
import 'toko_online_page.dart';
import 'film_movies_page.dart'; 

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int? selectedServiceIndex;

  final icons = [
    Icons.shopping_cart,
    Icons.movie_creation,
    Icons.fastfood,
    Icons.devices_other,
    Icons.videogame_asset,
    Icons.wb_sunny,
    Icons.newspaper,
    Icons.apps,
  ];

  final labels = [
    'Toko\nOnline',
    'Film &\nMovies',
    'Pesan\nMakanan',
    'Toko\nElektronik',
    'Voucher\nGame',
    'Cuaca',
    'Berita',
    'Semua\nLayanan',
  ];

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double itemHeight = screenHeight * 0.13;

    return Scaffold(
      backgroundColor: const Color(0xFFEAF2FF),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 80),
                child: Column(
                  children: [

                    SizedBox(
                      height: 160,
                      child: Stack(
                        children: [
                          Positioned(
                            top: 0,
                            left: 30,
                            right: 30,
                            child: Container(
                              height: 100,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 72, 77, 175),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 20,
                            left: 16,
                            right: 16,
                            child: Container(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [Color.fromARGB(255, 0, 0, 0), Color(0xFF4E54C8)],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.deepPurple.withOpacity(0.2),
                                    blurRadius: 12,
                                    offset: const Offset(0, 6),
                                  ),
                                ],
                              ),
                              child: Stack(
                                children: [
                                  Positioned(
                                    top: 0,
                                    right: 0,
                                    child: Image.asset(
                                      'assets/mastercard.png',
                                      width: 40,
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Total Wallet Balance',
                                        style: TextStyle(
                                          color: Colors.white.withOpacity(0.9),
                                          fontSize: 14,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Row(
                                        children: [
                                          const Text(
                                            'Rp.12.000.000',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 28,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          Icon(
                                            Icons.visibility_off,
                                            color: Colors.white.withOpacity(0.9),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 120),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Layanan',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            'Lihat Semuanya',
                            style: TextStyle(fontSize: 14, color: Colors.blue),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Layanan
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: GridView.builder(
                        itemCount: icons.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          mainAxisExtent: itemHeight,
                        ),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedServiceIndex = index;
                              });

                              if (index == 0) {
                                Navigator.push(context, MaterialPageRoute(builder: (_) => const TokoOnlinePage()));
                              } else if (index == 1) {
                                Navigator.push(context, MaterialPageRoute(builder: (_) => const FilmMoviesPage()));
                              }
                            },
                            child: _buildServiceItem(
                              icons[index],
                              labels[index],
                              selectedServiceIndex == index,
                            ),
                          );
                        },
                      ),
                    ),

                    const SizedBox(height: 24),

                    // History
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'History Transaction',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            'Lihat semuanya',
                            style: TextStyle(fontSize: 14, color: Colors.blue),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: [
                          _buildTransactionItem('Top Up BCA', 'Rp 100.000', '12 Jun 2025'),
                          _buildTransactionItem('Pesan Makanan', 'Rp 50.000', '10 Jun 2025'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),

              // Menu Cepat
              Positioned(
                top: 200,
                left: 16,
                right: 16,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      )
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildQuickMenu(context, Icons.qr_code, 'Scan & Pay'),
                      _buildQuickMenu(context, Icons.send, 'Transfer'),
                      _buildQuickMenu(context, Icons.request_page, 'Terima'),
                      _buildQuickMenu(context, Icons.add_circle, 'Top Up'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildServiceItem(IconData icon, String label, bool isSelected) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? const Color.fromARGB(255, 183, 107, 241) : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: isSelected ? Colors.white : Colors.deepPurple[50],
            child: Icon(
              icon,
              color: isSelected ? const Color(0xFF6C63FF) : Colors.deepPurple,
              size: 20,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: isSelected ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickMenu(BuildContext context, IconData icon, String label) {
    return GestureDetector(
      onTap: () {
        if (label == 'Scan & Pay') {
          Navigator.push(context, MaterialPageRoute(builder: (_) => const ScanPage()));
        } else if (label == 'Transfer') {
          Navigator.push(context, MaterialPageRoute(builder: (_) => const TransferPage()));
        } else if (label == 'Terima') {
          Navigator.push(context, MaterialPageRoute(builder: (_) => const TerimaPage()));
        } else if (label == 'Top Up') {
          Navigator.push(context, MaterialPageRoute(builder: (_) => const TopUpPage()));
        }
      },
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.blue[50],
            radius: 26,
            child: Icon(icon, color: Colors.blue[700], size: 28),
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionItem(String title, String amount, String date) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        backgroundColor: Colors.blue[100],
        child: Icon(Icons.swap_horiz, color: Colors.blue),
      ),
      title: Text(title, style: const TextStyle(color: Colors.black)),
      subtitle: Text(date, style: const TextStyle(color: Colors.black54)),
      trailing: Text(
        amount,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }
}
