import 'package:flutter/material.dart';

import '../data/categories_data.dart';
import '../widgets/category_vertical_card.dart';
import '../widgets/screen_title.dart';

class Explore extends StatelessWidget {
  const Explore({super.key});

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
        padding: const EdgeInsets.all(25),
        child: ListView(
          children: [
            const TextField(
              decoration: InputDecoration(
                hintText: '',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
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
              ),
              itemCount: categoriesList.length,
              itemBuilder: (BuildContext context, int index) {
                return CategoryVerticalCard(category: categoriesList[index]);
              },
            ),
          ],
        ),
      ),
    );
  }
}
