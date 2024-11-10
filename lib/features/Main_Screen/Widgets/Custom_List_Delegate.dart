import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffees_aplication/features/Main_Screen/View/main_screen.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class CustomListDelegate extends StatefulWidget {
  const CustomListDelegate({super.key});

  @override
  State<CustomListDelegate> createState() => _CustomListDelegateState();
}

final List<myStream> _myStreams = [];
final List<myStreamAnim> _controller = [];

class _CustomListDelegateState extends State<CustomListDelegate> {
  void getImages(
      AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snap) async {
    final storageRef = FirebaseStorage.instance.ref();

    for (int i = 0; i < snap.data!.size; i++) {
      _myStreams.add(myStream());
      _controller.add(myStreamAnim());
    }

    for (int i = 0; i < snap.data!.size; i++) {
      final pathReference =
          storageRef.child('coffees/${snap.data!.docs[i].id}/mainImage.png');

      final imageUrl = await pathReference.getDownloadURL();

      _myStreams[i].urls = imageUrl;
      _controller[i].counts = 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: 20,
        left: 20,
        top: 20,
        bottom: MediaQuery.of(context).size.height * 0.2,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AutoSizeText(
            'Каталог',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          StreamBuilder(
            stream:
                FirebaseFirestore.instance.collection('Coffees').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Text('Something went wrong');
              }
              if (!snapshot.hasData) {
                return const SizedBox();
              }

              if (_myStreams.isEmpty) {
                getImages(snapshot);
              }

              return GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: snapshot.data!.size,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  mainAxisExtent: 278,
                  maxCrossAxisExtent: 187,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                ),
                itemBuilder: (context, i) {
                  if (!_myStreams.asMap().containsKey(i)) {
                    return const SizedBox();
                  }
                  return StreamBuilder<double>(
                      stream: _controller[i].strims,
                      builder: (context, snapshotAnim) {
                        if (!_controller.asMap().containsKey(i)) {
                          return const SizedBox();
                        }

                        return AnimatedScale(
                          scale: _controller[i].count,
                          duration: const Duration(milliseconds: 300),
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
                                            stream: _myStreams[i].strims,
                                            builder: (context, snap) {
                                              if (_myStreams[i].url == '') {
                                                return const SizedBox();
                                              }
                                              return ClipRRect(
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft: Radius.circular(20),
                                                  topRight: Radius.circular(20),
                                                  bottomLeft:
                                                      Radius.circular(15),
                                                  bottomRight:
                                                      Radius.circular(15),
                                                ),
                                                child: Image.network(
                                                  _myStreams[i].url,
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  height: MediaQuery.of(context)
                                                      .size
                                                      .height,
                                                  fit: BoxFit.cover,
                                                  loadingBuilder: (context,
                                                      image, loadingProgress) {
                                                    if (loadingProgress ==
                                                        null) {
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
                                                '${snapshot.data!.docs[i]['price']} р.',
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 9,
                                              ),
                                              Image.asset(
                                                'assets/images/shop.png',
                                                width: 20,
                                                color: Colors.white,
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
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 15,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        AutoSizeText(
                                          snapshot.data!.docs[i]["name"],
                                          style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        AutoSizeText(
                                          '${snapshot.data!.docs[i]['milliliters']} мл.',
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400,
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
            },
          ),
        ],
      ),
    );
  }
}
