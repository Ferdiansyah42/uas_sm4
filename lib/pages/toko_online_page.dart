import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TokoOnlinePage extends StatefulWidget {
  const TokoOnlinePage({super.key});

  @override
  State<TokoOnlinePage> createState() => _TokoOnlinePageState();
}

class _TokoOnlinePageState extends State<TokoOnlinePage> {
  List products = [];
  bool isLoading = true;

  Future<void> fetchProducts() async {
    final response = await http.get(
      Uri.parse('https://dummyjson.com/products'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        products = data['products'];
        isLoading = false;
      });
    } else {
      throw Exception('Gagal memuat produk');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Toko Online'),
        backgroundColor: const Color.fromARGB(255, 126, 80, 206),
        automaticallyImplyLeading: false
      ),
      body:
          isLoading
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 16,
                    ),
                    child: ListTile(
                      leading: Image.network(
                        product['thumbnail'],
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                      title: Text(product['title']),
                      subtitle: Text("Rp ${product['price'] * 16000}"),
                    ),
                  );
                },
              ),
    );
  }
}
