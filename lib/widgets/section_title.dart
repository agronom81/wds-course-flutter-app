import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Color.fromRGBO(24, 23, 37, 1.0),
                fontWeight: FontWeight.w600,
                fontSize: 24,
              ),
            ),
            InkWell(
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
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}
