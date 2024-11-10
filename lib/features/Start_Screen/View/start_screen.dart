import 'package:coffees_aplication/features/Start_Screen/Widgets/Navigation_Button.dart';
import 'package:coffees_aplication/features/Start_Screen/Widgets/Title_Coffee_Card.dart';
import 'package:coffees_aplication/features/Start_Screen/Widgets/Welcome_Text.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 130, bottom: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleCoffeeCard(),
            Spacer(
              flex: 3,
            ),
            Expanded(
              flex: 5,
              child: WelcomeText(),
            ),
            Spacer(
              flex: 3,
            ),
            NavigationButton(),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
