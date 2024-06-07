import 'package:flutter/material.dart';

import '../common/color_apis.dart';
import '../models/category.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.category,
  });

  final Category category;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 105,
        width: 250,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: HexColor.fromHex(category.color),
        ),
        child: Row(
          children: [
            SizedBox(
              height: 70,
              width: 70,
              child: Image.network(
                category.icon,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: Text(
                category.name.replaceAll('&amp;', '&'),
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
