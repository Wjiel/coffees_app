import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffees_aplication/features/Main_Screen/Widgets/Coffee_Card.dart';
import 'package:coffees_aplication/features/Page_View_Screen/View/page_view_screen.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class CustomListDelegate extends StatefulWidget {
  const CustomListDelegate({super.key});

  @override
  State<CustomListDelegate> createState() => _CustomListDelegateState();
}

final List<myStream> myStreams = [];
final List<myStreamAnim> controller = [];

class _CustomListDelegateState extends State<CustomListDelegate> {
  getImages(AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snap) async {
    final storageRef = FirebaseStorage.instance.ref();

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
    return Padding(
      padding: EdgeInsets.only(
        right: 20,
        left: 20,
        top: 20,
        bottom: size.height * 0.2,
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
              if (!snapshot.hasData) {
                return const SizedBox();
              }

              if (myStreams.isEmpty) {
                getImages(snapshot);
              }

              return GridView.builder(
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
                        snapshot: snapshot,
                        index: i,
                      );
                    },
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
