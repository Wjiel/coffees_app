import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({super.key});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    return SliverAppBar(
      pinned: true,
      automaticallyImplyLeading: false,
      expandedHeight: screen.height * 0.5,
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30),
        ),
      ),
      toolbarHeight: 130,
      title: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AutoSizeText(
            'Заказать в',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 30,
            child: Row(
              children: [
                Flexible(child: Image.asset('assets/images/location.png')),
                const Flexible(child: SizedBox(width: 10)),
                const Expanded(
                  flex: 9,
                  child: AutoSizeText(
                    'г. Сургут, ул. Пушкина, д.9',
                    minFontSize: 1,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 30,
            child: Row(
              children: [
                Flexible(
                  child: Image.asset('assets/images/clock.png'),
                ),
                const Flexible(child: SizedBox(width: 10)),
                const Expanded(
                  flex: 9,
                  child: AutoSizeText(
                    'открыто с 06:00 до 21:00',
                    minFontSize: 1,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
      flexibleSpace: FlexibleSpaceBar(
        titlePadding:
            const EdgeInsets.only(top: 150, right: 15, left: 15, bottom: 15),
        title: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Spacer(
              flex: 4,
            ),
            Flexible(
              flex: 6,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF7E5424),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
