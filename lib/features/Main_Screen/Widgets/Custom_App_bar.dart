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
    final screen = MediaQuery.of(context).size;

    return SliverAppBar(
      clipBehavior: Clip.hardEdge,
      pinned: true,
      automaticallyImplyLeading: false,
      expandedHeight: screen.height * 0.5,
      bottom: PreferredSize(
          preferredSize: Size(0,15), child: SizedBox(height: 0,)
      ),
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
              width: 45,
              height: 45,
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
      flexibleSpace: const FlexibleSpaceBar(

        expandedTitleScale: 1,
        titlePadding:
            EdgeInsets.only(top: 90, right: 15, left: 15, bottom: 15),
        title: Flex(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          direction: Axis.vertical,
          children: [
            Flexible(
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
            Flexible(child: SizedBox(height: 10)),
            Flexible(flex: 7, child: DescountCoffeeDay()),
          ],
        ),
      ),
    );
  }
}
