import 'package:coffees_aplication/features/Basket_Screen/Widgets/Custom_App_bar.dart';
import 'package:coffees_aplication/features/Basket_Screen/Widgets/Custom_List_Delegate.dart';
import 'package:flutter/material.dart';

class BasketScreen extends StatelessWidget {
  ScrollController scrollController;
  BasketScreen({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        const CustomAppBar(),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              const CustomListDelegate(),
            ],
          ),
        ),
      ],
    );
  }
}
