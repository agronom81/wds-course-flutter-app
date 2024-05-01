import 'package:flutter/material.dart';
import 'package:wds_first_app/widgets/category_card.dart';
import 'package:wds_first_app/widgets/product_card.dart';
import 'package:wds_first_app/widgets/section_title.dart';

import '../data/categories_data.dart';
import '../data/offers_data.dart';
import '../models/categories.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: SectionTitle(title: 'Exclusive Offer'),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              height: 250,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 15,
                    width: 15,
                  );
                },
                itemCount: offers.length,
                itemBuilder: (context, index) {
                  return ProductCard(offer: offers[index], action: _addProduct);
                },
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: SectionTitle(title: 'Categories'),
          ),
          Padding(
            padding: const EdgeInsets.all(2.5),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (Category category in categories)
                    CategoryCard(category: category)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void _addProduct(value) {
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
}
