import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class CustomElevetedButton extends StatelessWidget {
  final Color color;
  final String text;
  final Function function;
  final double radius;
  const CustomElevetedButton({
    super.key,
    required this.color,
    required this.text,
    required this.function,
    required this.radius,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        function();
      },
      borderRadius: BorderRadius.circular(radius),
      child: Ink(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(radius),
        ),
        width: size.width,
        height: 55 + 5 * (size.height / 2040),
        child: Center(
          child: AutoSizeText(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontFamily: 'Slab',
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
