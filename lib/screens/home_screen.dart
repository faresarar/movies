import 'package:flutter/material.dart';
import 'package:movies/widgets/movies_slider.dart';

import '../services/movie_service.dart';
import '../widgets/horizontal_view_scroll.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> popularMovies = [];
  List<dynamic> topRatedMovies = [];
  List<dynamic> upComingMovies = [];
  List<dynamic> filteredMovies = [];
  bool isSearchEmpty = true;
  bool isLoading = true;
  MovieService movieService = MovieService();
  fetchMovies() {
    final popularMovies = movieService.popularMovies();
    final topRatedMovies = movieService.popularMovies();
    final upComingMovies = movieService.popularMovies();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    printData();
    super.initState();
  }

  printData() {
    final data = movieService.popularMovies();
    print(data.toString());
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 35),
          SearchBar(),
          isLoading
              ? CircularProgressIndicator()
              : Column(
                  children: [
                    Column(
                      spacing: 20,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16,
                          ),
                          child: Text(
                            "Top Rated Movies",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        MoviesSlider(topRatedMovies: topRatedMovies,),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            'Upcoming Movies',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        HorizontalView(movies: upComingMovies),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            'Popular Movies',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        HorizontalView(movies: popularMovies)
                      ],
                    )
                  ],
                )
        ],
      ),
    );
  }
}
