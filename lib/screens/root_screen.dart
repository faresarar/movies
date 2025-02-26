import 'package:flutter/material.dart';

import 'home_screen.dart';
import 'movies_screen.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  final PageController pageController = PageController(initialPage: 0);
  late int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: [
          HomeScreen(),
          MoviesScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.blueGrey,
        items: [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(
              Icons.home_outlined,
            ),
          ),
          BottomNavigationBarItem(
            label: "Movies",
            icon: Icon(
              Icons.movie,
            ),
          ),
        ],
        onTap: (index) {
          selectedIndex = index;
          pageController.jumpToPage(index);
        },
      ),
    );
  }
}
