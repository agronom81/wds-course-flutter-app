import 'package:flutter/material.dart';

import '../category_vertical_card.dart';

class ExploreCategories extends StatelessWidget {
  const ExploreCategories({
    super.key,
    required this.categories,
  });

  final List<dynamic> categories;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15.0,
        mainAxisSpacing: 15.0,
        mainAxisExtent: 210,
      ),
      itemCount: categories.length,
      itemBuilder: (BuildContext context, int index) {
        return CategoryVerticalCard(category: categories[index]);
      },
    );
  }
}
