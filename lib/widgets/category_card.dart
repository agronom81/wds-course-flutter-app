import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/categories.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.category});

  final Category category;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print('Go page ${category.title}');
      },
      child: Container(
        height: 105,
        width: 250,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: category.color,
        ),
        child: Row(
          children: [
            SizedBox(
              height: 70,
              width: 70,
              child: Image.network(
                category.imageUrl,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: Text(
                category.title,
                style: const TextStyle(
                  color: Color.fromRGBO(62, 66, 63, 1.0),
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            )
          ],
        ),
      ),
    );
  }
}
