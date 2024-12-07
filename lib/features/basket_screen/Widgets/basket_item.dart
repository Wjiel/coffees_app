import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class BasketItem extends StatefulWidget {
  const BasketItem({super.key});

  @override
  State<BasketItem> createState() => _BasketItemState();
}

class _BasketItemState extends State<BasketItem> {
  int count = 1;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65 + 10 * (MediaQuery.of(context).size.height / 2080),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.network(
              'https://firebasestorage.googleapis.com/v0/b/coffesshop-ee856.appspot.com/o/coffees%2F2EJ1QLpQObU8zK5LsKh8%2FmainImage.png?alt=media&token=d888cc3a-90b7-496a-a2dc-6732aa961a81',
              width: 65,
            ),
          ),
          const SizedBox(width: 15),
          const Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AutoSizeText(
                  'Американо',
                  minFontSize: 12,
                  style: TextStyle(
                    fontFamily: 'Slab',
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                AutoSizeText(
                  '52₽',
                  minFontSize: 12,
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xFF575757),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    if (count == 0) return;
                    setState(() {
                      count--;
                    });
                  },
                  borderRadius: BorderRadius.circular(360),
                  child: Ink(
                    height: 30,
                    width: 30,
                    decoration: const BoxDecoration(
                      color: Color(0xFF7E5424),
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: Text(
                        '-',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Text(
                  count.toString(),
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Slab',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      count++;
                    });
                  },
                  borderRadius: BorderRadius.circular(360),
                  child: Ink(
                    height: 30,
                    width: 30,
                    decoration: const BoxDecoration(
                      color: Color(0xFF7E5424),
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: Text(
                        '+',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
