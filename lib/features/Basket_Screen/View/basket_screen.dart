import 'package:coffees_aplication/features/Basket_Screen/Widgets/Custom_App_bar.dart';
import 'package:coffees_aplication/features/Main_Screen/View/main_screen.dart';
import 'package:coffees_aplication/features/Basket_Screen/Widgets/Custom_List_Delegate.dart';
import 'package:flutter/material.dart';

class BasketScreen extends StatefulWidget {
  const BasketScreen({super.key});

  @override
  State<BasketScreen> createState() => _BasketScreenState();
}

class _BasketScreenState extends State<BasketScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        const CustomAppBar(),
        SliverList(
          delegate: SliverChildListDelegate(
            [const CustomListDelegate()],
          ),
        ),
      ],
    );
  }
}
