import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wds_first_app/widgets/category_card.dart';
import 'package:wds_first_app/widgets/product_card.dart';
import 'package:wds_first_app/widgets/section_title.dart';

import '../data/categories_data.dart';
import '../data/offers_data.dart';
import '../icons/carrot.dart';
import '../widgets/search_field.dart';

class Home extends StatelessWidget {
  const Home({super.key});

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

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(
              height: 50,
              child: SvgPicture.string(
                carrot,
                height: 40,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
              child: SearchField(),
            ),
            const SectionTitle(
              title: 'Exclusive Offer',
              routeName: 'explore',
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
                itemCount: offers.length,
                itemBuilder: (context, index) {
                  return ProductCard(
                    offer: offers[index],
                    action: addProduct,
                  );
                },
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            const SectionTitle(
              title: 'Categories',
              routeName: 'explore',
            ),
            SizedBox(
              height: 105,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(right: 25, left: 25),
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
