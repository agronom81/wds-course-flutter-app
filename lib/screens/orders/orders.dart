import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/core.dart';
import '../../ui/ui.dart';
import 'widgets/orders_list.dart';

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
