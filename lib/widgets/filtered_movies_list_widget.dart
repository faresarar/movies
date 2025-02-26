import 'package:flutter/material.dart';

import '../screens/movie_details_screen.dart';

class FilteredMoviesList extends StatelessWidget {
  final List<dynamic> movies;
  const FilteredMoviesList({super.key, required this.movies});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: movies.length,
      itemBuilder: (context, index) {
        final movie = movies[index];
        return ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MovieDetailsScreen(movie: movie),
              ),
            );
          },
          leading: Image.network(
            'https://image.tmdb.org/t/p/w200${movie['poster_path']}',
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
          title: Text(movie['title']),
          subtitle: Text(movie['overview']),
        );
      },
    );
  }
}
