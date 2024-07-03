import 'package:flutter/material.dart';

import '../../models/order.dart';
import 'order_item.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({
    super.key,
    required this.order,
    required this.isLoading,
  });

  final Order order;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 20,
        bottom: 20,
      ),
      width: double.infinity,
      child: Column(
        children: [
          Center(
            child: Text(
              'Order #${order.id}',
              style: const TextStyle(
                color: Color.fromRGBO(24, 23, 37, 1.0),
                fontSize: 18,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          Column(
            children: [
              for (var product in order.products) OrderItem(product: product),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Total',
                style: TextStyle(
                  color: Color.fromRGBO(24, 23, 37, 1.0),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '\$${order.total}',
                style: const TextStyle(
                  color: Color.fromRGBO(24, 23, 37, 1.0),
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
              )
            ],
          ),
          const Divider(),
          if (isLoading)
            const SizedBox(
              height: 30,
              width: double.infinity,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
        ],
      ),
    );
  }
}
