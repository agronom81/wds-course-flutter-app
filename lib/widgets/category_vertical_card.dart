import 'package:flutter/material.dart';

import '../common/color_apis.dart';
import '../models/category.dart';

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
            color: category.color != ''
                ? HexColor.fromHex(category.color).withOpacity(0.25)
                : Colors.grey.shade200,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: category.color != ''
                  ? HexColor.fromHex(category.color)
                  : Colors.grey,
              width: 2,
            )),
        child: Column(
          children: [
            SizedBox(
              height: 93,
              width: 93,
              child: Image.network(
                category.icon,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Flexible(
              child: Text(
                textAlign: TextAlign.center,
                category.name != ''
                    ? category.name.replaceAll('&amp;', '&')
                    : '',
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
