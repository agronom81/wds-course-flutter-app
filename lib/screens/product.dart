import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wds_first_app/widgets/accordion.dart';

import '../models/offers.dart';
import '../widgets/image_slider.dart';
import '../widgets/primary_button.dart';
import '../widgets/qty_counter.dart';

class Product extends StatefulWidget {
  const Product({super.key});

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  @override
  Widget build(BuildContext context) {
    final Offer offer = GoRouterState.of(context).extra! as Offer;

    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        backgroundColor: const Color.fromRGBO(242, 242, 242, 1),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.upload,
              color: Color.fromRGBO(24, 23, 37, 1),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 330,
              alignment: Alignment.topCenter,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(242, 242, 242, 1),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25.0),
                  bottomRight: Radius.circular(25.0),
                ),
              ),
              child: ImageSlider(
                images: offer.images,
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
                          borderRadius: BorderRadius.circular(20),
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
                      const QtyCounter(),
                      Text('\$${offer.price}'),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Divider(
                    color: Color.fromRGBO(226, 226, 226, 0.7),
                  ),
                  for (var offerDescription in offer.description)
                    Column(
                      children: [
                        Accordion(offerDescription: [offerDescription]),
                        const Divider(
                          color: Color.fromRGBO(226, 226, 226, 0.7),
                        ),
                      ],
                    ),
                  const SizedBox(
                    height: 30,
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
