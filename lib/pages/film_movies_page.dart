import 'package:flutter/material.dart';

class FilmMoviesPage extends StatelessWidget {
  const FilmMoviesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Film & Movies',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 126, 80, 206),
      ),
      body: const Center(
        child: Text(
          'Ini Film & Movies',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
