import 'package:flutter/material.dart';
import 'package:movies/screens/root_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => RootScreen()));
    },);
    return Scaffold(
      body: Center(
        child: Image.asset("assets/splash.png"),
      ),
    );
  }
}
