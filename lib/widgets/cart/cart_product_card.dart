import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../models/cart_product.dart';
import '../../models/product_short.dart';
import '../../screens/cart/bloc/cart_bloc.dart';
import '../../screens/cart/bloc/cart_event.dart';
import '../qty_counter.dart';

class CartProductCard extends StatelessWidget {
  const CartProductCard({
    super.key,
    required this.cartProduct,
  });

  final CartProduct cartProduct;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 20,
        bottom: 20,
      ),
      width: double.infinity,
      child: Row(
        children: [
          SizedBox(
            height: 80,
            width: 80,
            child: Image.network(
              cartProduct.product.preview_image,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(
            width: 30,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            String id = cartProduct.product.id.toString();
                            context.push('/product/$id');
                          },
                          child: Text(
                            cartProduct.product.name,
                            style: const TextStyle(
                              color: Color.fromRGBO(24, 23, 37, 1.0),
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                        Text(
                          cartProduct.product.short_description,
                          style: const TextStyle(
                            color: Color.fromRGBO(124, 124, 124, 1.0),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () {
                        context.read<CartBloc>().add(
                              CartRemoveEvent(
                                productId: cartProduct.product.id,
                              ),
                            );
                      },
                      icon: const Icon(
                        Icons.close,
                        color: Color.fromRGBO(179, 179, 179, 1),
                        size: 30,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    QtyCounter(
                      initialCount: cartProduct.count,
                      inverse: true,
                      setCount: (int count) {
                        context.read<CartBloc>().add(
                              CartChangeEvent(
                                product: ProductShort(
                                  id: cartProduct.product.id,
                                  name: cartProduct.product.name,
                                  price: cartProduct.product.price,
                                  short_description:
                                      cartProduct.product.short_description,
                                  preview_image:
                                      cartProduct.product.preview_image,
                                ),
                                count: count,
                              ),
                            );
                      },
                    ),
                    Text(
                      '\$${cartProduct.product.price}',
                      style: const TextStyle(
                        color: Color.fromRGBO(24, 23, 37, 1.0),
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
