import 'package:flutter/material.dart';

import '../../widgets/screen_title.dart';

class Orders extends StatelessWidget {
  const Orders({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const ScreenTitle(
          title: 'Favourite',
        ),
      ),
      body: const Center(
        child: Text('Orders'),
      ),
    );
  }
}
