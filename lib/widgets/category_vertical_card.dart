import 'package:flutter/material.dart';

import '../models/categories.dart';

class CategoryVerticalCard extends StatelessWidget {
  const CategoryVerticalCard({super.key, required this.category});

  final Category category;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding:
            const EdgeInsets.only(top: 27, left: 30, right: 30, bottom: 15),
        decoration: BoxDecoration(
            color: category.color.withOpacity(0.25),
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: category.color,
              width: 2,
            )),
        child: Column(
          children: [
            SizedBox(
              height: 93,
              width: 93,
              child: Image.network(
                category.imageUrl,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Flexible(
              child: Text(
                textAlign: TextAlign.center,
                category.title,
                style: const TextStyle(
                  color: Color.fromRGBO(24, 23, 37, 1.0),
                  fontSize: 16,
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
