import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FilmMoviesPage extends StatefulWidget {
  const FilmMoviesPage({super.key});

  @override
  State<FilmMoviesPage> createState() => _FilmMoviesPageState();
}

class _FilmMoviesPageState extends State<FilmMoviesPage> {
  List movies = [];
  bool isLoading = true;

  Future<void> fetchMovies() async {
    final response = await http.get(
      Uri.parse('https://api.tvmaze.com/shows'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        movies = data;
        isLoading = false;
      });
    } else {
      throw Exception('Gagal memuat film');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Film & Movies', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 126, 80, 206),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
    );
  }
}
