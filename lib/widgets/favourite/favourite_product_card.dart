import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../models/product_short.dart';

class FavouriteProductCard extends StatelessWidget {
  const FavouriteProductCard({
    super.key,
    required this.product,
  });

  final ProductShort product;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 20,
        bottom: 20,
      ),
      width: double.infinity,
      child: InkWell(
        onTap: () {
          String id = product.id.toString();
          context.push('/product/$id');
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 80,
                  width: 80,
                  child: Image.network(
                    product.preview_image,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style: const TextStyle(
                        color: Color.fromRGBO(24, 23, 37, 1.0),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    Text(
                      product.short_description,
                      style: const TextStyle(
                        color: Color.fromRGBO(124, 124, 124, 1.0),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 8,
                ),
                Text(
                  '\$${product.price}',
                  style: const TextStyle(
                    color: Color.fromRGBO(24, 23, 37, 1.0),
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  width: 7,
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  color: Color.fromRGBO(24, 23, 37, 1),
                  size: 30,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
