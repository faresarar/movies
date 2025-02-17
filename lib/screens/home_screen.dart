import 'package:flutter/material.dart';

import '../services/movie_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    printData();
    super.initState();
  }

  printData() {
    MovieService movieService = MovieService();
    final data = movieService.popularMovies();
    print(data.toString());
  }

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 35),
          SearchBar(),
        ],
      ),
    );
  }
}
