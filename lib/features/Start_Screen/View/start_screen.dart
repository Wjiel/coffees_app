import 'package:coffees_aplication/features/Start_Screen/Widgets/Custom_Widget.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 130, bottom: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Coffee(context),
            const Spacer(
              flex: 3,
            ),
            Expanded(
              flex: 5,
              child: CustomText(),
            ),
            const Spacer(
              flex: 3,
            ),
            const CustomButton(),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
