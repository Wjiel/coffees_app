import 'package:auto_size_text/auto_size_text.dart';
import 'package:coffees_aplication/features/Main_Screen/Widgets/Descount_Coffee_Day.dart';
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
      clipBehavior: Clip.hardEdge,
      pinned: true,
      automaticallyImplyLeading: false,
      expandedHeight: size.height * 0.5,
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(20),
        ),
      ),
      title: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Row(
          children: [
            Container(
              width: 45 + 5 * (size.width / 1080),
              height: 45 + 5 * (size.width / 1080),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/images/logo.png'),
                ),
              ),
            ),
            const Spacer(),
            const AutoSizeText(
              "Merbel`s Coffee",
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.w900,
              ),
            ),
            const Spacer(
              flex: 9,
            ),
          ],
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        expandedTitleScale: 1,
        titlePadding: EdgeInsets.only(
          top: 90 + 10 * (size.width / 1080),
          right: 15,
          left: 15,
          bottom: 15,
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Spacer(),
            const Flexible(
              flex: 2,
              child: AutoSizeText(
                'Кофе дня',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Flexible(
                child: SizedBox(
              height: 5 + 5 * (size.width / 1080),
            )),
            const Flexible(
              flex: 7,
              child: DescountCoffeeDay(),
            ),
          ],
        ),
      ),
    );
  }
}
