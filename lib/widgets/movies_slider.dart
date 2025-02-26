import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class MoviesSlider extends StatelessWidget {
  const MoviesSlider({super.key, required this.topRatedMovies});
  final List<dynamic> topRatedMovies;
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: topRatedMovies.length,
      itemBuilder: (BuildContext context, int index, int realIndex) {
        final movie = topRatedMovies[index];
        return GestureDetector(
          onTap: () {},
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
                "https://image.tmdb.get.org/t/w500${movie['backdrop_path']}"),
          ),
        );
      },
      options: CarouselOptions(
        height: 250,
        autoPlay: true,
        autoPlayCurve: Curves.fastOutSlowIn,
        autoPlayAnimationDuration: const Duration(seconds: 1),
        enableInfiniteScroll: true,
        pageSnapping: true,
        enlargeCenterPage: true,
        viewportFraction: 0.8,
      ),
    );
  }
}
