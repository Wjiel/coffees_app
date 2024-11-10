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
    return Padding(
      padding: EdgeInsets.only(
        right: 20,
        left: 20,
        top: 20,
        bottom: screen.height * 0.2,
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(
            'Корзина',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 600,
          )
        ],
      ),
    );
  }
}
