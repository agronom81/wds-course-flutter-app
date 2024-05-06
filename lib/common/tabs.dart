import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../icons/shop.dart';

class Tabs extends StatefulWidget {
  final Widget child;

  const Tabs({super.key, required this.child});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int page = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            if (value == 0) {
              context.goNamed('shop');
            }

            if (value == 1) {
              context.goNamed('explore');
            }

            if (value == 2) {
              context.goNamed('cart');
            }

            if (value == 3) {
              context.goNamed('favourite');
            }

            if (value == 4) {
              context.goNamed('account');
            }
            setState(() {
              page = value;
            });
          },
          type: BottomNavigationBarType.fixed,
          currentIndex: page,
          unselectedItemColor: Colors.orange,
          selectedItemColor: Colors.blue,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.string(
                shop,
                width: 20,
                height: 20,
              ),
              label: 'Shop',
            ),
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.ac_unit,
              ),
              label: 'Explore',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.ac_unit),
              label: 'Cart',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.ac_unit),
              label: 'Favourite',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.ac_unit),
              label: 'Account',
            ),
          ]),
    );
  }
}
