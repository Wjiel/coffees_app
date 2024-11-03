import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:scroll_to_hide/scroll_to_hide.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late ScrollController _scrollController;

  int _indexNavigationBar = 0;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE9E9E9),
      extendBody: true,
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            pinned: true,
            automaticallyImplyLeading: false,
            expandedHeight: MediaQuery.of(context).size.height * 0.5,
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            title: Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
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
            flexibleSpace: FlexibleSpaceBar(
              title: Padding(
                padding: const EdgeInsets.only(
                    top: 120, right: 20, left: 20, bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Flexible(
                      flex: 4,
                      child: AutoSizeText(
                        'Кофе дня',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Flexible(child: SizedBox(height: 10)),
                    Flexible(
                      flex: 4,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      const AutoSizeText(
                        'Каталог',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 10,
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                          mainAxisExtent: 278,
                          maxCrossAxisExtent: 187,
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 20,
                        ),
                        itemBuilder: (context, i) {
                          return Container(
                            color: Colors.black,
                          );
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: ScrollToHide(
        scrollController: _scrollController,
        duration: const Duration(milliseconds: 300),
        hideDirection: Axis.vertical,
        height: 80,
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
                currentIndex: _indexNavigationBar,
                onTap: (index) {
                  setState(() {
                    _indexNavigationBar = index;
                  });
                },
                items: [
                  BottomNavigationBarItem(
                    icon: _indexNavigationBar == 0
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
                    icon: _indexNavigationBar == 1
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
                    icon: _indexNavigationBar == 2
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
      ),
    );
  }
}
