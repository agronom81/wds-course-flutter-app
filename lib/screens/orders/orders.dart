import 'package:flutter/material.dart';

import '../../widgets/orders/orders_list.dart';
import '../../widgets/screen_title.dart';

class Orders extends StatelessWidget {
  const Orders({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const ScreenTitle(
          title: 'Orders',
        ),
      ),
      body: const OrdersList(),
    );
  }
}
