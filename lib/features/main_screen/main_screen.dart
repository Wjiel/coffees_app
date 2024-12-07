import 'package:coffees_aplication/features/main_screen/Widgets/Body_List_View.dart';
import 'package:coffees_aplication/features/main_screen/Widgets/Custom_App_bar.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  ScrollController scrollController;
  MainScreen({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      body: BodyListView(),
    );
  }
}
