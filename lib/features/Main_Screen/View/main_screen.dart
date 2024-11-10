import 'dart:async';

import 'package:coffees_aplication/features/Basket_Screen/View/basket_screen.dart';
import 'package:coffees_aplication/features/Main_Screen/Widgets/Custom_App_bar.dart';
import 'package:coffees_aplication/features/Main_Screen/Widgets/Custom_List_Delegate.dart';
import 'package:coffees_aplication/features/Main_Screen/Widgets/Custom_Navigation_Bar.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
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

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE9E9E9),
      extendBody: true,
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: const [
          mainscreen(),
          BasketScreen(),
        ],
      ),
      bottomNavigationBar: const CustomNavigationBar(),
    );
  }
}

class mainscreen extends StatelessWidget {
  const mainscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        const CustomAppBar(),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              const CustomListDelegate(),
            ],
          ),
        ),
      ],
    );
  }
}
