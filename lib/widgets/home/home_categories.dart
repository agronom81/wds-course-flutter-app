import 'package:flutter/material.dart';

import '../../data/app_path.dart';
import '../../models/category.dart';
import '../category_card.dart';
import '../section_title.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({
    super.key,
    required this.categories,
  });

  final List<Category> categories;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(
          title: 'Categories',
          routeName: AppPath.explore,
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
        const SizedBox(
          height: 50,
        ),
      ],
    );
  }
}
