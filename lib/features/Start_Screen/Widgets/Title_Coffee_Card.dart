import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class TitleCoffeeCard extends StatelessWidget {
  const TitleCoffeeCard({super.key});

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    return Transform.rotate(
      angle: -45 * math.pi / 180,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const AutoSizeText(
            "Merbel`s",
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.w400,
              fontFamily: 'Rubik',
            ),
          ),
          Container(
            width: screen.width,
            height: screen.height * 0.22,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(120),
            ),
            clipBehavior: Clip.hardEdge,
            child: Transform.scale(
              scale: 1.3,
              child: Image.asset(
                'assets/images/coffeeStart.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          const AutoSizeText(
            "Coffee",
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.w400,
              fontFamily: 'Rubik',
            ),
          ),
        ],
      ),
    );
  }
}
