import 'package:coffees_aplication/Config/theme_data/theme_data.dart';
import 'package:flutter/material.dart';

import 'Start_Screen/start_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final List _allAsset = [
    "assets/images/clock.png",
    "assets/images/coffeeStart.png",
    "assets/images/location.png",
    "assets/images/logo.png",
    "assets/images/menu.png",
    "assets/images/menu_outline.png",
    "assets/images/persone.png",
    "assets/images/persone_outline.png",
    "assets/images/Polygon.png",
    "assets/images/Rectangle.png",
    "assets/images/shop.png",
    "assets/images/shop_outline.png",
    "assets/images/Star.png",
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkLaunch();
    });
  }

  Future<void> _checkLaunch() async {
    for (var asset in _allAsset) {
      await precacheImage(AssetImage(asset), context);
    }
    if (!mounted) return;
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => MaterialApp(
          theme: defaultTheme,
          debugShowCheckedModeBanner: false,
          home: const StartScreen(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: defaultTheme,
      themeAnimationDuration: const Duration(milliseconds: 300),
      themeAnimationCurve: Curves.easeInOutCirc,
      home: Scaffold(
        body: Center(
          child: Container(
            height: 200,
            width: 200,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "assets/images/logo.png",
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
