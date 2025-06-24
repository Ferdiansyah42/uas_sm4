import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PesanMakananPage extends StatefulWidget {
  const PesanMakananPage({super.key});

  @override
  State<PesanMakananPage> createState() => _PesanMakananPageState();
}

class _PesanMakananPageState extends State<PesanMakananPage> {
  List<dynamic> makananList = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchMakanan();
  }

  Future<void> fetchMakanan() async {
    final url = Uri.parse('https://www.themealdb.com/api/json/v1/1/search.php?f=c'); // ambil makanan huruf 'c'
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        makananList = data['meals'] ?? [];
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
      // Error handling bisa ditambahkan di sini
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEAF2FF),
      appBar: AppBar(
        title: const Text('Pesan Makanan', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        automaticallyImplyLeading: false,
      ),
      
    );
  }
}
