import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TokoElektronikPage extends StatefulWidget {
  const TokoElektronikPage({super.key});

  @override
  State<TokoElektronikPage> createState() => _TokoElektronikPageState();
}

class _TokoElektronikPageState extends State<TokoElektronikPage> {
  List<dynamic> produkList = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchProdukElektronik();
  }

  Future<void> fetchProdukElektronik() async {
    final url = Uri.parse('https://dummyjson.com/products/category/smartphones');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        produkList = data['products'] ?? [];
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEAF2FF),
      appBar: AppBar(
        title: const Text('Toko Elektronik', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        automaticallyImplyLeading: false,
      ),
      
    );
  }
}
