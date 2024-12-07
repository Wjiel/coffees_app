import 'package:auto_size_text/auto_size_text.dart';
import 'package:coffees_aplication/features/Page_View_Screen/page_view_screen.dart';
import 'package:flutter/material.dart';

import '../../../Config/colors.dart';

class NavigationButton extends StatelessWidget {
  const NavigationButton({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const PageViewScreen()),
        );
      },
      borderRadius: BorderRadius.circular(30),
      child: Ink(
        width: size.width,
        height: 50 + 10 * (size.height / 2400),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: PrimaryColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: AutoSizeText(
                  'Продолжить',
                  minFontSize: 10,
                  maxLines: 1,
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
