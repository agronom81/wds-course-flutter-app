import 'package:flutter/material.dart';

import '../product_card.dart';
import '../section_title.dart';

class HomeProducts extends StatelessWidget {
  const HomeProducts({
    super.key,
    required this.products,
    required this.blockTitle,
    required this.routeName,
  });

  final List<dynamic> products;
  final String blockTitle;
  final String routeName;

  @override
  Widget build(BuildContext context) {
    void addProduct(value) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Alert'),
              content: Text(value),
              actions: [
                FilledButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Ok'))
              ],
            );
          });
    }

    return Column(
      children: [
        SectionTitle(
          title: blockTitle,
          routeName: routeName,
        ),
        SizedBox(
          height: 250,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 15,
                width: 15,
              );
            },
            padding: const EdgeInsets.only(right: 25, left: 25),
            itemCount: products.length,
            itemBuilder: (context, index) {
              return ProductCard(
                offer: products[index],
                action: addProduct,
              );
            },
          ),
        ),
        const SizedBox(
          height: 50,
        ),
      ],
    );
  }
}
