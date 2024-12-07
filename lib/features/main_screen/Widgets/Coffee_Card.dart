import 'package:auto_size_text/auto_size_text.dart';
import 'package:coffees_aplication/features/streams.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CoffeeCard extends StatelessWidget {
  final myStreamAnim controller;
  final myStream stream;
  final String name;
  final int price;
  final int milliliters;
  const CoffeeCard({
    super.key,
    required this.controller,
    required this.stream,
    required this.name,
    required this.price,
    required this.milliliters,
  });

  // Future<void> addCoffeeToBasket() async {
  //   print(1);
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setStringList('Coffee', [
  //     name,
  //     price.toString(),
  //     stream.url,
  //   ]);
  // }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AnimatedScale(
      curve: Curves.easeInOutCirc,
      scale: controller.count,
      duration: const Duration(milliseconds: 300),
      child: InkWell(
        onTap: () {
          //   addCoffeeToBasket();
        },
        borderRadius: BorderRadius.circular(20),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Stack(
                  children: [
                    Center(
                      child: StreamBuilder<dynamic>(
                          stream: stream.strims,
                          builder: (context, snap) {
                            if (stream.url == '') {
                              return const SizedBox();
                            }
                            return ClipRRect(
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(20),
                                bottom: Radius.circular(15),
                              ),
                              child: SizedBox.expand(
                                child: Image.network(
                                  stream.url,
                                  fit: BoxFit.cover,
                                  loadingBuilder:
                                      (context, image, loadingProgress) {
                                    if (loadingProgress == null) {
                                      return image;
                                    }
                                    return Shimmer.fromColors(
                                      baseColor: Colors.grey[300]!,
                                      highlightColor: Colors.white,
                                      child: Container(
                                        color: Colors.grey,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            );
                          }),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 5),
                        decoration: BoxDecoration(
                            color: const Color(0xFF3E2810),
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: Colors.white,
                              width: 1,
                            )),
                        child: SizedBox(
                          height: 20 + 5 * (size.width / 1080),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              AutoSizeText(
                                '$price р.',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Slab',
                                ),
                              ),
                              SizedBox(
                                width: 5 + 3 * (size.width / 1080),
                              ),
                              Image.asset(
                                'assets/images/shop.png',
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 15,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        name,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Slab',
                        ),
                      ),
                      AutoSizeText(
                        '$milliliters мл.',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Slab',
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
