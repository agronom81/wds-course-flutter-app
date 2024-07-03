import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../data/app_path.dart';
import '../../widgets/orders/orders_list.dart';
import '../../widgets/screen_title.dart';

class Orders extends StatelessWidget {
  const Orders({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const ScreenTitle(
          title: 'Orders',
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.go(AppPath.account);
          },
        ),
      ),
      body: const OrdersList(),
    );
  }
}
