import 'package:flutter/material.dart';

import '../../common/app_color.dart';
import '../../models/product.dart';
import '../accordion.dart';
import '../image_slider.dart';
import '../primary_button.dart';
import '../qty_counter.dart';
import 'favourite_button.dart';

class SingleProduct extends StatelessWidget {
  const SingleProduct({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
              images: product.images,
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
                          product.name,
                        ),
                        Text(
                          product.shortDescription,
                          style: const TextStyle(
                            color: AppColor.textColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    FavouriteButton(
                      product: product,
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
                    Text('\$${product.price}'),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                const Divider(
                  color: Color.fromRGBO(226, 226, 226, 0.7),
                ),
                Accordion(description: [
                  {
                    'title': 'Product Detail',
                    'description': product.description
                  }
                ]),
                Column(
                  children: [
                    Accordion(description: _createNutrition(product)),
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
    );
  }

  _createNutrition(Product product) {
    return [
      {
        'title': 'Nutritions',
        'description': product.nutritions,
        'weight': '100gr',
      }
    ];
  }
}
