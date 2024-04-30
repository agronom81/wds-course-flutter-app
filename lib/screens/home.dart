import 'package:flutter/material.dart';
import 'package:wds_first_app/widgets/category_card.dart';
import 'package:wds_first_app/widgets/product_card.dart';
import 'package:wds_first_app/widgets/section_title.dart';

import '../data/categories_data.dart';
import '../data/offers_data.dart';
import '../models/categories.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const SectionTitle(title: 'Exclusive Offer'),
            const SizedBox(
              height: 20,
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
                itemCount: offers.length,
                itemBuilder: (context, index) {
                  return ProductCard(
                    offer: offers[index],
                  );
                },
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            const SectionTitle(title: 'Categories'),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 105,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 15,
                    width: 15,
                  );
                },
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return CategoryCard(
                    category: categories[index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
