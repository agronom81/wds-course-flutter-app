import 'package:flutter/material.dart';

import '../data/categories_data.dart';
import '../widgets/category_vertical_card.dart';
import '../widgets/screen_title.dart';
import '../widgets/search_field.dart';

class Explore extends StatelessWidget {
  const Explore({super.key, this.state});
  final dynamic state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const ScreenTitle(
          title: 'Find Products',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 25, right: 25),
        child: ListView(
          children: [
            const SizedBox(
              height: 30,
            ),
            const SearchField(),
            const SizedBox(
              height: 25,
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15.0,
                mainAxisSpacing: 15.0,
                mainAxisExtent: 210,
              ),
              itemCount: categoriesList.length,
              itemBuilder: (BuildContext context, int index) {
                return CategoryVerticalCard(category: categoriesList[index]);
              },
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
