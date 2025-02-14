import 'package:flutter/material.dart';

void main() {
  runApp(const MoviesApp());
}

class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies App',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Colors.grey[900],
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white),
          bodySmall: TextStyle(color: Colors.white),
        ),
        appBarTheme: AppBarTheme(
          actionsIconTheme: IconThemeData(
            color: Colors.white,
          )
        ),
      ),
      home: const Center(
        child: Text("Movie App"),
      ),
    );
  }
}

