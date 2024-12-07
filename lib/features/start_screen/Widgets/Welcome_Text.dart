import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({super.key});

  @override
  Widget build(BuildContext context) {
    return const AutoSizeText.rich(
      minFontSize: 10,
      TextSpan(
        children: [
          TextSpan(
            text: "Добро пожаловать!",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              fontFamily: 'Serif',
            ),
          ),
          TextSpan(
            text:
                "\n\nМы всегда рады видеть Вас в нашей кофейне!\nНадеемся, что мы поможем добавить бодрости и вкуса в Ваш день!",
            style: TextStyle(
              fontFamily: 'Slab',
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
