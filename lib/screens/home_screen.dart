import 'package:flutter/material.dart';
import 'package:movies/widgets/movies_slider.dart';

import '../services/movie_service.dart';
import '../widgets/filtered_movies_list_widget.dart';
import '../widgets/horizontal_view_scroll.dart';
import '../widgets/search_bar.dart';

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
  fetchMovies() async {
    MovieService movieService = MovieService();
    popularMovies = await movieService.popularMovies();
    topRatedMovies = await movieService.topRatedMovies();
    upComingMovies = await movieService.upcomingMovies();
    setState(() {
      isLoading = false;
    });
  }

  void filterMovies({required String query}) {
    setState(() {
      filteredMovies = popularMovies
              .where((movie) =>
                  movie['title'].toLowerCase().contains(query.toLowerCase()))
              .toList() +
          upComingMovies
              .where((movie) =>
                  movie['title'].toLowerCase().contains(query.toLowerCase()))
              .toList() +
          topRatedMovies
              .where((movie) =>
                  movie['title'].toLowerCase().contains(query.toLowerCase()))
              .toList();
      if (query.isEmpty) {
        isSearchEmpty = true;
      } else {
        isSearchEmpty = false;
      }
    });
  }

  @override
  void initState() {
    fetchMovies();
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
          SearchBarWidget(),
          isLoading
              ? CircularProgressIndicator()
              : isSearchEmpty
                  ? Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(16),
                          child: Text(
                            'Filtered Movies',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        FilteredMoviesList(movies: filteredMovies)
                      ],
                    )
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
                            MoviesSlider(
                              topRatedMovies: topRatedMovies,
                            ),
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
