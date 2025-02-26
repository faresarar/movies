import 'package:flutter/material.dart';
import 'package:movies/services/movie_service.dart';
import '../widgets/movie_widget.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({super.key});

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  List<dynamic> upComingMovies = [];
  bool isLoading = true;
  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    MovieService movieService = MovieService();
    upComingMovies = await movieService.upcomingMovies();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("UpComing Movies"),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              children: List.generate(
                upComingMovies.length,
                (index) {
                  final movie = upComingMovies[index];
                  return MovieWidget(movie: movie);
                },
              ),
            ),
    );
  }
}