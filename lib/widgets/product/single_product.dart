import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../common/app_color.dart';
import '../../data/app_path.dart';
import '../../models/product.dart';
import '../../models/product_short.dart';
import '../../screens/cart/bloc/cart_bloc.dart';
import '../../screens/cart/bloc/cart_event.dart';
import '../accordion.dart';
import '../image_slider.dart';
import '../primary_button.dart';
import '../qty_counter.dart';
import 'favourite_button.dart';

class SingleProduct extends StatefulWidget {
  const SingleProduct({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  State<SingleProduct> createState() => _SingleProductState();
}

class _SingleProductState extends State<SingleProduct> {
  late int count;

  @override
  void initState() {
    super.initState();
    count = 1;
  }

  @override
  Widget build(BuildContext context) {
    void setCount(int value) {
      setState(() {
        count = value;
      });
    }

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
              images: widget.product.images,
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
                          widget.product.name,
                        ),
                        Text(
                          widget.product.shortDescription,
                          style: const TextStyle(
                            color: AppColor.textColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    FavouriteButton(
                      product: widget.product,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    QtyCounter(
                      setCount: setCount,
                    ),
                    Text('\$${widget.product.price}'),
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
                    'description': widget.product.description
                  }
                ]),
                Column(
                  children: [
                    Accordion(description: _createNutrition(widget.product)),
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
                  action: () {
                    context.read<CartBloc>().add(
                          CartAddEvent(
                            product: ProductShort(
                              id: widget.product.id,
                              name: widget.product.name,
                              price: widget.product.price,
                              short_description:
                                  widget.product.shortDescription,
                              preview_image: widget.product.preview_image,
                            ),
                            count: count,
                          ),
                        );
                    context.go(AppPath.cart);
                  },
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
