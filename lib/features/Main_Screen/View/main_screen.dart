import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffees_aplication/features/Main_Screen/Widgets/Custom_Navigation_Bar.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

int indexNavigationBar = 0;

final ScrollController scrollController = ScrollController();

final List<AnimationController> controller = [];

class _myStream {
  late String url;

  set _url(String urlImage) {
    url = urlImage;
    _controller.add(url);
  }

  final StreamController<String> _controller = StreamController.broadcast();

  Stream<String> get strims => _controller.stream;
}

final List<_myStream> _myStreams = [];

final _streamCoffeeDay = _myStream();

String coffesDayUrl = '';

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  void getImages(
      AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snap) async {
    final storageRef = FirebaseStorage.instance.ref();

    for (int i = 0; i < snap.data!.size; i++) _myStreams.add(_myStream());

    for (int i = 0; i < snap.data!.size; i++) {
      final pathReference =
          storageRef.child('coffees/${snap.data!.docs[i].id}/mainImage.png');

      final imageUrl = await pathReference.getDownloadURL();

      controller.add(AnimationController(
          vsync: this, duration: const Duration(milliseconds: 1500)));
      _myStreams[i]._url = imageUrl;
    }
  }

  void getImageCoffesDay(
      AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snap) async {
    final pathReference = FirebaseStorage.instance
        .ref()
        .child('coffees/${snap.data!.docs[0].id}/image.png');
    print(snap.data!.docs[0].id);

    final imageUrl = await pathReference.getDownloadURL();
    _streamCoffeeDay._url = imageUrl;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE9E9E9),
      extendBody: true,
      body: CustomScrollView(
        controller: scrollController,
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
              titlePadding: const EdgeInsets.only(
                  top: 120, right: 15, left: 15, bottom: 15),
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
                    flex: 4,
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
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Text("Loading");
                          }
                          getImageCoffesDay(snapshot);

                          return StreamBuilder<dynamic>(
                              stream: _streamCoffeeDay.strims,
                              builder: (context, snap) {
                                if (!snap.hasData) {
                                  return const SizedBox();
                                }
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Flexible(
                                      flex: 3,
                                      child: Stack(
                                        children: [
                                          Center(
                                            child: ClipRRect(
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(20),
                                                topRight: Radius.circular(20),
                                              ),
                                              child: Image.network(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                height: MediaQuery.of(context)
                                                    .size
                                                    .height,
                                                snap.data,
                                                fit: BoxFit.cover,
                                                loadingBuilder: (context, image,
                                                    loadingProgress) {
                                                  if (loadingProgress == null) {
                                                    return image;
                                                  }
                                                  return const Center(
                                                    child:
                                                        CircularProgressIndicator(
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
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 12,
                                                      vertical: 5),
                                              decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xFF3E2810),
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
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.bold,
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
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 12,
                                                      vertical: 5),
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
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.bold,
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
                                                snapshot.data!.docs[0]
                                                    ['description'],
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
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.only(
                      right: 20, left: 20, top: 20, bottom: 100),
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
                      StreamBuilder(
                          stream: FirebaseFirestore.instance
                              .collection('Coffees')
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return const Text('Something went wrong');
                            }
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Text("Loading");
                            }

                            if (_myStreams.isEmpty) {
                              getImages(snapshot);
                            }

                            return GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: snapshot.data!.size,
                              gridDelegate:
                                  const SliverGridDelegateWithMaxCrossAxisExtent(
                                mainAxisExtent: 278,
                                maxCrossAxisExtent: 187,
                                mainAxisSpacing: 20,
                                crossAxisSpacing: 20,
                              ),
                              itemBuilder: (context, i) {
                                if (!_myStreams.asMap().containsKey(i)) {
                                  return const SizedBox();
                                }
                                return StreamBuilder<dynamic>(
                                    stream: _myStreams[i].strims,
                                    builder: (context, snap) {
                                      if (!controller.asMap().containsKey(i)) {
                                        return const SizedBox();
                                      }
                                      return ScaleTransition(
                                        scale: CurvedAnimation(
                                          parent: controller[i],
                                          curve: Curves.bounceOut,
                                        ),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                flex: 2,
                                                child: Stack(
                                                  children: [
                                                    Center(
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            const BorderRadius
                                                                .only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  20),
                                                          topRight:
                                                              Radius.circular(
                                                                  20),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  15),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  15),
                                                        ),
                                                        child: Image.network(
                                                          _myStreams[i].url,
                                                          width: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width,
                                                          height: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .height,
                                                          fit: BoxFit.cover,
                                                          loadingBuilder: (context,
                                                              image,
                                                              loadingProgress) {
                                                            if (loadingProgress ==
                                                                null) {
                                                              controller[i]
                                                                  .forward();
                                                              return image;
                                                            }
                                                            return const Center(
                                                              child:
                                                                  CircularProgressIndicator(
                                                                color:
                                                                    Colors.grey,
                                                              ),
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          Alignment.topRight,
                                                      child: Container(
                                                        margin: const EdgeInsets
                                                            .all(10),
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                horizontal: 12,
                                                                vertical: 5),
                                                        decoration:
                                                            BoxDecoration(
                                                                color: const Color(
                                                                    0xFF3E2810),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5),
                                                                border:
                                                                    Border.all(
                                                                  color: Colors
                                                                      .white,
                                                                  width: 1,
                                                                )),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            AutoSizeText(
                                                              '${snapshot.data!.docs[i]['price']} р.',
                                                              style:
                                                                  const TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              width: 9,
                                                            ),
                                                            Image.asset(
                                                              'assets/images/shop.png',
                                                              width: 20,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                    horizontal: 20,
                                                    vertical: 15,
                                                  ),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      AutoSizeText(
                                                        snapshot.data!.docs[i]
                                                            ["name"],
                                                        style: const TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                      AutoSizeText(
                                                        '${snapshot.data!.docs[i]['milliliters']} мл.',
                                                        style: const TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    });
                              },
                            );
                          }),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const CustomNavigationBar(),
    );
  }
}
