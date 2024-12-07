import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffees_aplication/features/main_screen/Widgets/Coffee_Card.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import '../../streams.dart';
import 'Descount_Coffee_Day.dart';

class BodyListView extends StatefulWidget {
  const BodyListView({super.key});

  @override
  State<BodyListView> createState() => _BodyListViewState();
}

class _BodyListViewState extends State<BodyListView> {
  final List<myStream> myStreams = [];
  final List<myStreamAnim> controller = [];
  getImages(AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snap) async {
    final storageRef = FirebaseStorage.instance.ref();

    if (snap.data == null) return;

    for (int i = 0; i < snap.data!.size; i++) {
      myStreams.add(myStream());
      controller.add(myStreamAnim());
    }

    for (int i = 0; i < snap.data!.size; i++) {
      final pathReference =
          storageRef.child('coffees/${snap.data!.docs[i].id}/mainImage.png');

      final imageUrl = await pathReference.getDownloadURL();

      myStreams[i].urls = imageUrl;
      controller[i].counts = 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ListView(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(30))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const AutoSizeText(
                    'Кофе дня',
                    maxFontSize: 35,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Slab',
                    ),
                  ),
                  SizedBox(
                    height: 5 + 5 * (size.width / 1080),
                  ),
                  SizedBox(
                      height: 250 + 5 * (size.width / 1080),
                      child: const DiscountCoffeeDay()),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: AutoSizeText(
                'Каталог',
                minFontSize: 35,
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Slab',
                ),
              ),
            ),
            StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection('Coffees').snapshots(),
              builder: (context, snapshot) {
                if (myStreams.isEmpty) {
                  getImages(snapshot);
                }
                if (snapshot.connectionState == ConnectionState.waiting &&
                    !snapshot.hasData) {
                  return const SizedBox();
                }

                return GridView.builder(
                  padding: const EdgeInsets.all(20),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: snapshot.data!.size,
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    mainAxisExtent: 270 + 10 * (size.width / 1080),
                    maxCrossAxisExtent: size.width / 2,
                    mainAxisSpacing: 15 + 5 * (size.width / 1080),
                    crossAxisSpacing: 15 + 5 * (size.width / 1080),
                  ),
                  itemBuilder: (context, i) {
                    if (!myStreams.asMap().containsKey(i)) {
                      return const SizedBox();
                    }
                    return StreamBuilder<double>(
                      stream: controller[i].strims,
                      builder: (context, snapshotAnim) {
                        if (!controller.asMap().containsKey(i)) {
                          return const SizedBox();
                        }

                        return CoffeeCard(
                          controller: controller[i],
                          stream: myStreams[i],
                          name: snapshot.data!.docs[i]["name"],
                          price: snapshot.data!.docs[i]['price'],
                          milliliters: snapshot.data!.docs[i]['milliliters'],
                        );
                      },
                    );
                  },
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}
