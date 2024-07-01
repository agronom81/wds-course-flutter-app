import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wds_first_app/models/order_product_short.dart';

import '../data/app_path.dart';
import '../models/category.dart';
import '../models/order.dart';
import '../models/product.dart';
import '../models/product_short.dart';

dynamic getValue(data, key) {
  if (data is Map && data.containsKey(key)) {
    return data[key];
  }

  return null;
}

String clearName(dynamic name) {
  if (name == null) return '';
  return name.replaceAll('&amp;', '&');
}

List<ProductShort> createProductShort(List<dynamic> products) {
  List<ProductShort> productShorts = [];

  if (products.isNotEmpty) {
    for (var product in products) {
      productShorts.add(ProductShort(
        id: product['id'],
        name: product['name'],
        price: product['price'],
        short_description: product['short_description'],
        preview_image: product['preview_image'],
      ));
    }
  }

  return productShorts;
}

List<Category> createCategory(List<dynamic> categoriesList) {
  List<Category> categories = [];

  if (categoriesList.isNotEmpty) {
    for (var category in categoriesList) {
      categories.add(Category(
        id: category['id'],
        name: category['name'],
        icon: category['icon'],
        color: category['color'],
      ));
    }
  }

  return categories;
}

Product createProduct(dynamic productFull) {
  Product product = Product(
    id: productFull['id'],
    name: productFull['name'],
    price: productFull['price'],
    shortDescription: productFull['shortDescription'],
    description: productFull['description'],
    preview_image: productFull['preview_image'],
    images: productFull['images'].cast<String>(),
    categories: productFull['categories'].cast<int>(),
    nutritions: productFull['nutritions'],
  );

  return product;
}

void showAlertDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Product added to cart'),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FilledButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all<Color>(
                        const Color.fromRGBO(124, 124, 124, 1)),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Cancel'),
                ),
                FilledButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    context.go(AppPath.cart);
                  },
                  child: const Text('Go to cart'),
                )
              ],
            )
          ],
        );
      });
}

String getProductSum(String price, int count) {
  double cost = double.parse(price);
  return (cost * count).toStringAsFixed(2);
}

String getFirstLetter(String input) {
  if (input.isNotEmpty) {
    return input[0];
  }
  return '';
}

List<Order> createOrdersList(List<dynamic> ordersList) {
  List<Order> orders = [];

  if (ordersList.isNotEmpty) {
    for (var order in ordersList) {
      List<OrderProductShort> orderProducts = [];

      for (var product in order['products']) {
        orderProducts.add(OrderProductShort(
          id: product['id'] as int,
          name: product['name'],
          price: product['price'],
          short_description: product['shortDescription'],
          preview_image: product['preview_image'],
          quantity: product['quantity'] as int,
        ));
      }

      orders.add(
        Order(
          id: order['id'] as int,
          total: order['total'],
          status: order['status'],
          products: orderProducts,
        ),
      );
    }
  }
  return orders;
}
