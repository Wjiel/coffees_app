import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class CustomListDelegate extends StatefulWidget {
  const CustomListDelegate({super.key});

  @override
  State<CustomListDelegate> createState() => _CustomListDelegateState();
}

class _CustomListDelegateState extends State<CustomListDelegate> {
  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(20),
      shrinkWrap: true,
      children: [
        const AutoSizeText(
          'Корзина',
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          height: 1750,
          color: Colors.pink,
        ),
      ],
    );
  }
}
