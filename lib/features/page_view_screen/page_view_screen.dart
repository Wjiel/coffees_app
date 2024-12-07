import 'package:coffees_aplication/features/Basket_Screen/basket_screen.dart';
import 'package:coffees_aplication/features/Widgets/custom_navigation_bar.dart';
import 'package:coffees_aplication/features/main_screen/main_screen.dart';
import 'package:flutter/material.dart';

class PageViewScreen extends StatefulWidget {
  const PageViewScreen({super.key});

  @override
  State<PageViewScreen> createState() => _PageViewScreen();
}

class _PageViewScreen extends State<PageViewScreen> {
  final ScrollController scrollController = ScrollController();
  final PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: [
          MainScreen(scrollController: scrollController),
          BasketScreen(scrollController: scrollController),
        ],
      ),
      bottomNavigationBar: CustomNavigationBar(
        pageController: pageController,
        scrollController: scrollController,
      ),
    );
  }
}
