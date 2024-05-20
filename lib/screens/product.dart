import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../models/offers.dart';
import '../widgets/primary_button.dart';

class Product extends StatefulWidget {
  const Product({super.key});

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  int count = 1;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Offer offer = GoRouterState.of(context).extra! as Offer;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 1'),
        backgroundColor: const Color.fromRGBO(242, 242, 242, 1),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(
                left: 40,
                right: 40,
                top: 25,
              ),
              width: double.infinity,
              height: 320,
              alignment: Alignment.topCenter,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(242, 242, 242, 1),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25.0),
                  bottomRight: Radius.circular(25.0),
                ),
              ),
              child: Image.network(
                offer.bigImageUrl,
                fit: BoxFit.contain,
                // fit: BoxFit.contain,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            offer.title,
                          ),
                          Text(
                            offer.qty,
                            style: const TextStyle(
                              color: Color.fromRGBO(124, 124, 124, 1),
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: InkWell(
                          onTap: () {},
                          child: const Icon(
                            Icons.favorite_border,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Counter'),
                      Text('\$${offer.price}'),
                    ],
                  ),
                  PrimaryButton(
                    title: 'Add To Basket',
                    action: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
