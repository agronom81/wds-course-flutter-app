import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    super.key,
    required this.title,
    required this.routeName,
  });

  final String title;
  final String routeName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25),
      child: Column(
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
                  context.goNamed(
                    routeName,
                    extra: 'Hello',
                  );
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
      ),
    );
  }
}
