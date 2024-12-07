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
    final size = MediaQuery.of(context).size;
    return SliverAppBar(
      pinned: true,
      automaticallyImplyLeading: false,
      expandedHeight: size.height * 0.5,
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30),
        ),
      ),
      toolbarHeight: 130 + 10 * (size.width / 1080),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AutoSizeText(
            'Заказать в',
            minFontSize: 32,
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
           SizedBox(height: 10 + 5 * (size.width / 1080),),
          SizedBox(
            height: 30 + 5 * (size.height / 2040),
            child: Row(
              children: [
                Flexible(child: Image.asset('assets/images/location.png'),),
                Flexible(
                    child: SizedBox(
                  width: 10 + 5 * (size.width / 1080),
                ),),
                const Expanded(
                  flex: 9,
                  child: AutoSizeText(
                    'г. Сургут, ул. Пушкина, д.9',
                    minFontSize: 10,
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
          SizedBox(
            height: 10 + 5 * (size.width / 1080),
          ),
          SizedBox(
            height: 30 + 5 * (size.width / 1080),
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
                    minFontSize: 10,
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
           SizedBox(height: 10 + 5 * (size.width / 1080)),
        ],
      ),
      flexibleSpace: FlexibleSpaceBar(
        expandedTitleScale: 1,
        titlePadding: EdgeInsets.only(
            top: 180 + 15 * (size.width / 1080),
            right: 15,
            left: 15,
            bottom: 15,
        ),
        title: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Spacer(
              flex: 1,
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
