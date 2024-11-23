import 'package:coffees_aplication/features/Page_View_Screen/View/page_view_screen.dart';
import 'package:flutter/material.dart';
import 'package:scroll_to_hide/scroll_to_hide.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({super.key});

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  int indexNavigationBar = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ScrollToHide(
      scrollController: scrollController,
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
              showSelectedLabels: false,
              showUnselectedLabels: false,
              elevation: 0,
              iconSize: 28,
              selectedFontSize: 0,
              unselectedFontSize: 0,
              backgroundColor: Colors.transparent,
              currentIndex: indexNavigationBar,
              onTap: (index) {
                setState(() {
                  indexNavigationBar = index;
                  pageController.animateToPage(
                    indexNavigationBar,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInCubic,
                  );
                });
              },
              items: [
                BottomNavigationBarItem(
                  icon: indexNavigationBar == 0
                      ? Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 5),
                          decoration: const BoxDecoration(
                            color: Color(0xFFBF9768),
                            borderRadius: BorderRadius.horizontal(
                              right: Radius.circular(20),
                              left: Radius.circular(20),
                            ),
                          ),
                          child: Image.asset(
                            'assets/images/menu.png',
                            width: 28,
                            height: 28,
                          ),
                        )
                      : Image.asset(
                          'assets/images/menu_outline.png',
                          width: 28,
                          height: 28,
                        ),
                  label: '',
                  tooltip: 'Каталог',
                ),
                BottomNavigationBarItem(
                  icon: indexNavigationBar == 1
                      ? Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 5),
                          decoration: const BoxDecoration(
                            color: Color(0xFFBF9768),
                            borderRadius: BorderRadius.horizontal(
                              right: Radius.circular(20),
                              left: Radius.circular(20),
                            ),
                          ),
                          child: Image.asset(
                            'assets/images/shop.png',
                            width: 28,
                            height: 28,
                          ),
                        )
                      : Image.asset(
                          'assets/images/shop_outline.png',
                          width: 28,
                          height: 28,
                        ),
                  label: '',
                  tooltip: 'Карзина',
                ),
                BottomNavigationBarItem(
                  icon: indexNavigationBar == 2
                      ? Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 5),
                          decoration: const BoxDecoration(
                            color: Color(0xFFBF9768),
                            borderRadius: BorderRadius.horizontal(
                              right: Radius.circular(20),
                              left: Radius.circular(20),
                            ),
                          ),
                          child: Image.asset(
                            'assets/images/persone.png',
                            width: 28,
                            height: 28,
                          ),
                        )
                      : Image.asset(
                          'assets/images/persone_outline.png',
                          width: 28,
                          height: 28,
                        ),
                  label: '',
                  tooltip: 'Акаунт',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
