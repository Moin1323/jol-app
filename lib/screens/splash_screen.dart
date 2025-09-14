import 'dart:async';
import 'package:flutter/material.dart';
// Import your Onboarding screen
import 'onboarding/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Wait 3 seconds then go to OnboardingScreen
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnboardingScreen()),
      );
    });
  }

  // Updated colors based on your palette
  static const Color textBlue = Color(0xFF0734A5);
  static const Color textGreen = Color(0xFF43AC45);
  static const Color textPink = Color(0xFFC42AF8);

  static const double logoFontSize = 40;

  TextSpan _coloredLetter(String letter, int index) {
    final colors = [textBlue, textGreen, textPink];
    return TextSpan(
      text: letter,
      style: TextStyle(
        color: colors[index % 3],
        fontSize: logoFontSize,
        fontWeight: FontWeight.w500,
        fontFamily: 'Digitalt',
        letterSpacing: logoFontSize * 0.04,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final jol = <TextSpan>[
      _coloredLetter('J', 0),
      _coloredLetter('O', 1),
      _coloredLetter('L', 2),
    ];

    final puzzles = <TextSpan>[
      _coloredLetter('P', 3),
      _coloredLetter('U', 4),
      _coloredLetter('Z', 5),
      _coloredLetter('Z', 6),
      _coloredLetter('L', 7),
      _coloredLetter('E', 8),
      _coloredLetter('S', 9),
    ];

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFFC0CB),
              Color(0xFFADD8E6),
              Color(0xFFE6E6FA),
            ],
          ),
        ),
        child: Stack(
          children: [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'lib/assets/images/logo.png',
                    height: 100,
                  ),
                  const SizedBox(width: 12),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(text: TextSpan(children: jol)),
                      const SizedBox(height: 4),
                      RichText(text: TextSpan(children: puzzles)),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 24,
              left: 0,
              right: 0,
              child: const Text(
                'Must Try...!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Aleo',
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                  height: 1.0,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
