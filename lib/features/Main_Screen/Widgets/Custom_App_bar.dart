import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffees_aplication/features/Main_Screen/View/main_screen.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({super.key});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

final _streamCoffeeDay = myStream();

class _CustomAppBarState extends State<CustomAppBar> {
  void getImageCoffesDay(
      AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snap) async {
    final pathReference = FirebaseStorage.instance
        .ref()
        .child('coffees/${snap.data!.docs[0].id}/image.png');

    final imageUrl = await pathReference.getDownloadURL();
    _streamCoffeeDay.urls = imageUrl;
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
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
        titlePadding:
            const EdgeInsets.only(top: 120, right: 15, left: 15, bottom: 15),
        title: Flex(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          direction: Axis.vertical,
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
              flex: 5,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF7E5424),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('CoffeesDay')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return const Text('Something went wrong');
                    }
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Colors.grey,
                        ),
                      );
                    }

                    return StreamBuilder<dynamic>(
                        stream: _streamCoffeeDay.strims,
                        builder: (context, snap) {
                          if (_streamCoffeeDay.url == '') {
                            getImageCoffesDay(snapshot);
                            return const SizedBox();
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
                                      child: ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20),
                                        ),
                                        child: Image.network(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: MediaQuery.of(context)
                                              .size
                                              .height,
                                          _streamCoffeeDay.url,
                                          fit: BoxFit.cover,
                                          loadingBuilder: (context, image,
                                              loadingProgress) {
                                            if (loadingProgress == null) {
                                              return image;
                                            }
                                            return const Center(
                                              child: CircularProgressIndicator(
                                                color: Colors.grey,
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: Container(
                                        margin: const EdgeInsets.all(10),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12, vertical: 5),
                                        decoration: BoxDecoration(
                                            color: const Color(0xFF3E2810),
                                            borderRadius:
                                                BorderRadius.circular(5),
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
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 9,
                                            ),
                                            Image.asset(
                                              'assets/images/shop.png',
                                              width: 12,
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
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            AutoSizeText(
                                              '${snapshot.data!.docs[0]['milliliters']} мл.',
                                              minFontSize: 1,
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 12,
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
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                        });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
