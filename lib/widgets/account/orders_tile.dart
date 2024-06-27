import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../data/app_path.dart';
import '../custom_text.dart';

class OrdersTile extends StatelessWidget {
  const OrdersTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: ListTile(
        leading: SvgPicture.asset(
          'icons/shoppingBag.svg',
          width: 24,
          height: 24,
        ),
        title: const CustomText(
          text: 'Orders',
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        trailing: const Icon(
          Icons.chevron_right,
          size: 30,
          color: Color.fromRGBO(24, 23, 37, 1),
        ),
        onTap: () {
          context.push(AppPath.orders);
        },
      ),
    );
  }
}
