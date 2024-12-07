import 'package:auto_size_text/auto_size_text.dart';
import 'package:coffees_aplication/Config/colors.dart';
import 'package:coffees_aplication/features/Widgets/custom_eleveted_button.dart';
import 'package:coffees_aplication/features/basket_screen/Widgets/Predloz_Coffee_Card.dart';
import 'package:flutter/material.dart';

import 'basket_item.dart';

class CustomListDelegate extends StatefulWidget {
  const CustomListDelegate({super.key});

  @override
  State<CustomListDelegate> createState() => _CustomListDelegateState();
}

class _CustomListDelegateState extends State<CustomListDelegate> {
  @override
  void initState() {
    super.initState();
//    GetCoffeeInfo();
  }

  // Future<void> GetCoffeeInfo() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.getStringList('Coffee') ?? '';
  //
  //   print(prefs.getStringList('Coffee'));
  // }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(20),
      shrinkWrap: true,
      children: [
        const AutoSizeText(
          'Корзина',
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            fontFamily: 'Slab',
          ),
        ),
        const SizedBox(height: 20),
        const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            BasketItem(),
          ],
        ),
        const SizedBox(height: 20),
        const AutoSizeText(
          'Предложения',
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            fontFamily: 'Slab',
          ),
        ),
        SizedBox(
          height: 140 + 10 * (size.height / 2400),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              PredlozCoffeeCard(
                name: 'Американо',
                millilitres: 150,
                price: 52,
              ),
            ],
          ),
        ),
        const AutoSizeText(
          'Промокод',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            fontFamily: 'Slab',
          ),
        ),
        SizedBox(
          height: 15 + 5 * (size.height / 2400),
        ),
        ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(18)),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Введите промокод...',
              fillColor: Colors.white,
              filled: true,
              border: InputBorder.none,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              contentPadding: const EdgeInsets.all(15),
              hintStyle: const TextStyle(
                fontFamily: 'Slab',
                color: Color(0xFF878787),
                fontSize: 18,
              ),
              suffix: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {},
                  child: const Text(
                    'Применить',
                    style: TextStyle(
                      color: Color(0xFFACACAC),
                      fontFamily: 'Slab',
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20 + 5 * (size.height / 2400),
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AutoSizeText(
              'Общая сумма',
              style: TextStyle(
                fontFamily: 'Slab',
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            AutoSizeText(
              '52р',
              style: TextStyle(
                fontFamily: 'Slab',
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: PrimaryColor,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10 + 5 * (size.height / 2400),
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AutoSizeText(
              'Скидка',
              style: TextStyle(
                fontFamily: 'Slab',
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            AutoSizeText(
              '-0р',
              style: TextStyle(
                fontFamily: 'Slab',
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: PrimaryColor,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 30 + 5 * (size.height / 2400),
        ),
        CustomElevetedButton(
          color: PrimaryColor,
          text: 'Оплатить 52р',
          function: () {},
          radius: 30,
        ),
      ],
    );
  }
}
