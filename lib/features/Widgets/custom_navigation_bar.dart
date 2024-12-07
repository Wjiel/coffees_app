import 'dart:async';

import 'package:coffees_aplication/Config/colors.dart';
import 'package:flutter/material.dart';
import 'package:scroll_to_hide/scroll_to_hide.dart';

class CustomNavigationBar extends StatefulWidget {
  PageController pageController;
  ScrollController scrollController;
  CustomNavigationBar({
    super.key,
    required this.pageController,
    required this.scrollController,
  });

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  final double sizeIcon = 28;
  int indexNavigationBar = 0;

  EdgeInsets padding = const EdgeInsets.symmetric(horizontal: 10, vertical: 6);

  @override
  void initState() {
    super.initState();
    changeAnim();
  }

  void changeAnim() {
    setState(() {
      padding = const EdgeInsets.symmetric(horizontal: 10, vertical: 6);
    });
    Timer.periodic(const Duration(milliseconds: 100), (timer) {
      setState(() {
        padding = const EdgeInsets.symmetric(horizontal: 28, vertical: 6);
      });
      timer.cancel();
    });
  }

  void swich(int index) {
    setState(() {
      indexNavigationBar = index;
    });
    widget.pageController.animateToPage(
      indexNavigationBar,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOutCirc,
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget container(Widget child) {
      return Container(
        margin: const EdgeInsets.all(15),
        decoration: const BoxDecoration(
          color: Secondary,
          borderRadius: BorderRadius.horizontal(
            right: Radius.circular(30),
            left: Radius.circular(30),
          ),
        ),
        child: AnimatedPadding(
          curve: Curves.easeInOutCubic,
          padding: padding,
          duration: const Duration(milliseconds: 200),
          child: child,
        ),
      );
    }

    final items = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        activeIcon: container(
          Image.asset(
            'assets/images/menu.png',
            width: sizeIcon,
            color: ColorIconNavigationBar,
          ),
        ),
        icon: Image.asset(
          'assets/images/menu_outline.png',
          width: sizeIcon,
        ),
        label: '',
        tooltip: 'Каталог',
      ),
      BottomNavigationBarItem(
        activeIcon: container(
          Image.asset(
            'assets/images/shop.png',
            width: sizeIcon,
            color: ColorIconNavigationBar,
          ),
        ),
        icon: Image.asset(
          'assets/images/shop_outline.png',
          width: sizeIcon,
        ),
        label: '',
        tooltip: 'Корзина',
      ),
      BottomNavigationBarItem(
        activeIcon: container(
          Image.asset(
            'assets/images/persone.png',
            width: sizeIcon,
            color: ColorIconNavigationBar,
          ),
        ),
        icon: Image.asset(
          'assets/images/persone_outline.png',
          width: sizeIcon,
        ),
        label: '',
        tooltip: 'Аккаунт',
      ),
    ];
    final size = MediaQuery.of(context).size;
    return ScrollToHide(
      scrollController: widget.scrollController,
      duration: const Duration(milliseconds: 300),
      hideDirection: Axis.vertical,
      height: 80 + 5 * (size.width / 1080),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 15.4,
                  spreadRadius: 1,
                )
              ],
            ),
            child: BottomNavigationBar(
              currentIndex: indexNavigationBar,
              onTap: (index) {
                if (index != indexNavigationBar) {
                  changeAnim();
                }

                swich(index);
              },
              items: items,
            ),
          ),
        ),
      ),
    );
  }
}
