import 'package:flutter/material.dart';
import 'package:wds_first_app/widgets/product_card.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Colors.white,
        child: SizedBox(
          height: 250,
          child: ListView.separated(
            padding: const EdgeInsets.all(10),
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 15,
                width: 15,
              );
            },
            itemCount: 10,
            itemBuilder: (context, index) {
              return const ProductCard();
            },
          ),
        ),
      ),
    );
  }
}
