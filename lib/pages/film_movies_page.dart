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
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: movies.length,
              itemBuilder: (context, index) {
                final movie = movies[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ListTile(
                    leading: movie['image'] != null
                        ? Image.network(
                            movie['image']['medium'],
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          )
                        : const Icon(Icons.movie),
                    title: Text(movie['name']),
                    subtitle: Text(movie['genres'].join(', ')),
                  ),
                );
              },
            ),
    );
  }
}
