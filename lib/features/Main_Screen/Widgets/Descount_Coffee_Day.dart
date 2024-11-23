import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffees_aplication/features/Page_View_Screen/View/page_view_screen.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class DescountCoffeeDay extends StatefulWidget {
  const DescountCoffeeDay({super.key});

  @override
  State<DescountCoffeeDay> createState() => _DescountCoffeeDayState();
}

final myStream _streamCoffeeDay = myStream();

class _DescountCoffeeDayState extends State<DescountCoffeeDay> {
  void _getImageCoffesDay(
      AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snap) async {
    final pathReference = FirebaseStorage.instance
        .ref()
        .child('coffees/${snap.data!.docs[0].id}/image.png');

    final imageUrl = await pathReference.getDownloadURL();
    _streamCoffeeDay.urls = imageUrl;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const double radius = 20;
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF7E5424),
        borderRadius: BorderRadius.circular(radius),
      ),
      child: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('CoffeesDay').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Shimmer.fromColors(
              baseColor: const Color(0xFF7E5424),
              highlightColor: Colors.white,
              child: SizedBox(
                width: size.width,
                height: size.height,
              ),
            );
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                flex: 4,
                child: Stack(
                  children: [
                    Center(
                      child: StreamBuilder<dynamic>(
                          stream: _streamCoffeeDay.strims,
                          builder: (context, snap) {
                            if (_streamCoffeeDay.url == '') {
                              _getImageCoffesDay(snapshot);
                              return const SizedBox();
                            }
                            return ClipRRect(
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(radius),
                              ),
                              child: Image.network(
                                width: size.width,
                                height: size.height,
                                _streamCoffeeDay.url,
                                fit: BoxFit.cover,
                                loadingBuilder:
                                    (context, image, loadingProgress) {
                                  if (loadingProgress == null) {
                                    return image;
                                  }
                                  return Shimmer.fromColors(
                                    baseColor: const Color(0xFF7E5424),
                                    highlightColor:
                                        const Color.fromARGB(255, 79, 54, 28),
                                    child: Container(
                                      color:
                                          const Color.fromARGB(255, 34, 22, 9),
                                    ),
                                  );
                                },
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
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            AutoSizeText(
                              '${snapshot.data!.docs[0]['price']} р.',
                              minFontSize: 1,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10 + 5 * (size.width / 1080),
                            ),
                            Image.asset(
                              'assets/images/shop.png',
                              width: 15 + 5 * (size.width / 1080),
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 5),
                        decoration: BoxDecoration(
                          color: const Color(0xFF32A763),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            AutoSizeText(
                              '${snapshot.data!.docs[0]['milliliters']} мл.',
                              minFontSize: 1,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 2,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: AutoSizeText(
                          snapshot.data!.docs[0]['name'],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Flexible(
                        child: AutoSizeText(
                          snapshot.data!.docs[0]['description'],
                          minFontSize: 1,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
