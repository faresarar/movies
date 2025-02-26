import 'dart:convert';

import 'package:http/http.dart' as http;

class MovieService {
  final headers = {
    'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyZjA0OGUzZTAyNWZmZTllMTU1MjUwN2U4ZjNjMThlNCIsInN1YiI6IjY2MjIwNzQyMGQxMWYyMDE2NDAxZmU3ZSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.T1gac2LPIJCklcwpYRZUVjfaRId6WJqQBeXG5Rf3asI',
    'accept': 'application/json'
  };
  Future<List<dynamic>> popularMovies() async {
    final response = await http.get(
      Uri.parse(
          'https://api.themoviedb.org/3/movie/popular?language=en-US&page=1'),
      headers: headers,
    );
    if (response.statusCode == 200) {
      return (jsonDecode(response.body))['results'];
    } else {
      throw ('Error');
    }
  }

  Future<List<dynamic>> upcomingMovies() async {
    final response = await http.get(
      Uri.parse(
          'https://api.themoviedb.org/3/movie/upcoming?language=en-US&page=1'),
      headers: headers,
    );
    if (response.statusCode == 200) {
      return (jsonDecode(response.body))['results'];
    } else {
      throw ('Error');
    }
  }

  Future<List<dynamic>> topRatedMovies() async {
    final response = await http.get(
      Uri.parse(
          'https://api.themoviedb.org/3/movie/top_rated?language=en-US&page=1'),
      headers: headers,
    );
    if (response.statusCode == 200) {
      return json.decode(response.body)['results'];
    } else {
      throw ('Error');
    }
  }

  Future<List<dynamic>> similarMovies({required int movieId}) async {
    final response = await http.get(
      Uri.parse(
          'https://api.themoviedb.org/3/movie/$movieId/similar?language=en-US&page=1'),
      headers: headers,
    );
    if (response.statusCode == 200) {
      return json.decode(response.body)['results'];
    } else {
      throw Exception('Error');
    }
  }
}
