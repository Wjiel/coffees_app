import 'dart:async';

import 'package:coffees_aplication/features/Basket_Screen/View/basket_screen.dart';
import 'package:coffees_aplication/features/Main_Screen/View/main_screen.dart';
import 'package:coffees_aplication/features/Main_Screen/Widgets/Custom_Navigation_Bar.dart';
import 'package:flutter/material.dart';

class PageViewScreen extends StatefulWidget {
  const PageViewScreen({super.key});

  @override
  State<PageViewScreen> createState() => _PageViewScreen();
}

final ScrollController scrollController = ScrollController();

PageController pageController = PageController();

class myStream {
  late String url = '';

  set urls(String urlImage) {
    url = urlImage;
    _controller.add(url);
  }

  final StreamController<String> _controller = StreamController.broadcast();

  Stream<String> get strims => _controller.stream;
}

class myStreamAnim {
  late double count = 0;

  set counts(double cou) {
    count = cou;
    _controller.add(count);
  }

  final StreamController<double> _controller = StreamController.broadcast();

  Stream<double> get strims => _controller.stream;
}

class _PageViewScreen extends State<PageViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE9E9E9),
      extendBody: true,
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: const [
          MainScreen(),
          BasketScreen(),
        ],
      ),
      bottomNavigationBar: const CustomNavigationBar(),
    );
  }
}
