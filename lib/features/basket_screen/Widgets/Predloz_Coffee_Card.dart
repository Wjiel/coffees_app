import 'package:auto_size_text/auto_size_text.dart';
import 'package:coffees_aplication/Config/colors.dart';
import 'package:flutter/material.dart';

class PredlozCoffeeCard extends StatelessWidget {
  final String name;
  final int millilitres;
  final int price;
  const PredlozCoffeeCard({
    super.key,
    required this.name,
    required this.millilitres,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Expanded(
            flex: 6,
            child: Stack(
              children: [
                SizedBox.expand(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: 25 + 5 * (size.height / 2400),
                    width: size.width,
                    decoration: const BoxDecoration(
                      color: Color(0xFF7E5424),
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(15),
                      ),
                    ),
                    alignment: Alignment.center,
                    child: AutoSizeText(
                      name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Slab',
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: AutoSizeText.rich(
                style: const TextStyle(
                  fontFamily: 'Slab',
                  fontSize: 14,
                ),
                TextSpan(
                  children: [
                    TextSpan(text: '${millilitres} мл., '),
                    TextSpan(
                      text: '${price}р',
                      style: const TextStyle(
                        color: PrimaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
