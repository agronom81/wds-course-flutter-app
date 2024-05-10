import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../icons/account.dart';
import '../icons/cart.dart';
import '../icons/explore.dart';
import '../icons/favourite.dart';
import '../icons/shop.dart';

class Tabs extends StatefulWidget {
  final Widget child;

  const Tabs({super.key, required this.child});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  String page = 'shop';
  final List<Map<String, dynamic>> _icons = [
    {'icon': shop, 'label': 'Shop', 'route': 'shop'},
    {'icon': explore, 'label': 'Explore', 'route': 'explore'},
    {'icon': cart, 'label': 'Cart', 'route': 'cart'},
    {'icon': favourite, 'label': 'Favourite', 'route': 'favourite'},
    {'icon': account, 'label': 'Account', 'route': 'account'}
  ];
  final Color _defaultColor = const Color.fromRGBO(24, 23, 37, 1);
  final Color _activeColor = const Color.fromRGBO(83, 177, 117, 1);

  _getActiveColor(route) {
    if (page == route) {
      return _activeColor;
    }

    return _defaultColor;
  }

  void _goTo(name) {
    setState(() {
      page = '$name';
    });
    context.goNamed('$name');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: Container(
        height: 92,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(15.0),
          ),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(85, 94, 88, 0.09),
              spreadRadius: 0,
              blurRadius: 15,
              offset: Offset(2, -5),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            for (Map<String, dynamic> icon in _icons)
              InkWell(
                onTap: () {
                  _goTo(icon['route']);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.string(
                      icon['icon'],
                      width: 24,
                      height: 24,
                      colorFilter: ColorFilter.mode(
                        _getActiveColor(icon['route']),
                        BlendMode.srcIn,
                      ),
                    ),
                    Text(
                      icon['label'],
                      style: TextStyle(
                        fontSize: 12,
                        color: _getActiveColor(icon['route']),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
