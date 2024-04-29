import 'package:flutter/material.dart';

class SeeAll extends StatelessWidget {
  const SeeAll({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print('GO');
      },
      child: const Text(
        'See all',
        style: TextStyle(
          color: Color.fromRGBO(83, 177, 117, 1.0),
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
      ),
    );
  }
}
