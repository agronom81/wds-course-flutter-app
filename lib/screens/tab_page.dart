import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TabPage extends StatefulWidget {
  final Widget child;
  const TabPage({super.key, required this.child});

  @override
  State<TabPage> createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  int page = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            print(value);
            if (value == 0) {
              context.go('/page3');
            }

            if (value == 1) {
              context.go('/page2');
            }
            setState(() {
              page = value;
            });
          },
          currentIndex: page,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.access_alarm),
              label: 'Page3',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.ac_unit),
              label: 'Page2',
            ),
          ]),
    );
    ;
  }
}
