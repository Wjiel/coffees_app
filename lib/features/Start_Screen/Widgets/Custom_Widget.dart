import 'package:coffees_aplication/features/Main_Screen/View/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'dart:math' as math;

Widget Coffee(BuildContext context) {
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

Widget CustomText() {
  return RichText(
    text: const TextSpan(
      children: [
        TextSpan(
          text: "Добро пожаловать!",
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        TextSpan(
          text:
              "\n\nМы всегда рады видеть Вас в нашей кофейне!\nНадеемся, что мы поможем добавить бодрости и вкуса в Ваш день!",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    ),
  );
}

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const MainScreen()));
      },
      borderRadius: BorderRadius.circular(30),
      child: Ink(
        width: screen.width,
        height: screen.height * 0.06,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: const Color(0xFF3E2810),
          borderRadius: BorderRadius.circular(30),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Expanded(
              child: Align(
                child: AutoSizeText(
                  'Продолжить',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.white,
                  size: 35,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
