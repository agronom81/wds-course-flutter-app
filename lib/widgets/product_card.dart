import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/offers.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.offer,
    required this.action,
  });

  final dynamic offer;
  final void Function(dynamic value) action;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: 175,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: const Color.fromRGBO(226, 226, 226, 1.0),
        ),
        borderRadius: BorderRadius.circular(18),
      ),
      child: InkWell(
        onTap: () {
          dynamic id = offer['id'];
          context.push('/product/$id');
        },
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(
                child: SizedBox(
                  height: 80,
                  width: 100,
                  child: Image.network(
                    offer['preview_image'],
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    offer['name'],
                    style: const TextStyle(
                      color: Color.fromRGBO(24, 23, 37, 1.0),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  Text(
                    offer['short_description'],
                    style: const TextStyle(
                      color: Color.fromRGBO(124, 124, 124, 1.0),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$${offer['price']}',
                    style: const TextStyle(
                      color: Color.fromRGBO(24, 23, 37, 1.0),
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      action('${offer['id']} - ${offer['price']}');
                    },
                    borderRadius: BorderRadius.circular(17),
                    splashColor: Colors.yellow,
                    child: Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(17),
                        color: const Color.fromRGBO(83, 177, 117, 1.0),
                      ),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
