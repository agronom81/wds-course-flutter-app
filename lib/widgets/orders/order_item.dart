import 'package:flutter/material.dart';
import 'package:wds_first_app/models/order_product_short.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({
    super.key,
    required this.product,
  });

  final OrderProductShort product;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              '\$${product.price} * ${product.quantity}',
              style: const TextStyle(
                color: Color.fromRGBO(24, 23, 37, 1.0),
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
        Row(
          children: [
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
        const SizedBox(height: 8)
      ],
    );
  }
}
