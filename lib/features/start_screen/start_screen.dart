import 'package:coffees_aplication/features/Start_Screen/Widgets/Navigation_Button.dart';
import 'package:coffees_aplication/features/Start_Screen/Widgets/Title_Coffee_Card.dart';
import 'package:coffees_aplication/features/Start_Screen/Widgets/Welcome_Text.dart';
import 'package:coffees_aplication/features/start_screen/Widgets/animation_rotation.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 100 + 10 * (size.width / 1040),
              right: 20 + 10 * (size.width / 1040),
              child: animation_rotation(
                url: 'assets/images/Polygon.png',
                size: 60 + 10 * (size.width / 1040),
              ),
            ),
            Positioned(
              top: 80 + 10 * (size.width / 1040),
              left: -40 + 10 * (size.width / 1040),
              child: animation_rotation(
                url: 'assets/images/Star.png',
                size: 100 + 10 * (size.width / 1040),
              ),
            ),
            Positioned(
              top: size.height * 0.4,
              left: 230 + 10 * (size.width / 1040),
              child: animation_rotation(
                url: 'assets/images/Rectangle.png',
                size: 200 + 10 * (size.width / 1040),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(flex: 4),
                  TitleCoffeeCard(),
                  Spacer(flex: 2),
                  Expanded(flex: 5, child: WelcomeText()),
                  Spacer(),
                  NavigationButton(),
                  Spacer(flex: 2),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
