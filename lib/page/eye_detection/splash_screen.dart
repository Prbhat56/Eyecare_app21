import 'package:flutter/material.dart';
import 'package:healthcare_app/page/eye_detection/review_page.dart';
import 'package:splashscreen/splashscreen.dart';

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({Key? key});

  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 1,
      backgroundColor: Colors.pink[100],
      imageBackground: Image.asset("assets/icon.jpeg").image,
      useLoader: true,
      loaderColor: Colors.white,
      navigateAfterSeconds: const EyeScannerPage(),
      loadingText: const Text(
        "LOADING...",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
      ),
      title: const Text(
        "Welcome to\nEye Detection App",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 36,
          fontWeight: FontWeight.bold,
        ),
      ),
      photoSize: 100,
    );
  }
}
