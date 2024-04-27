import 'package:flutter/material.dart';

class Page4 extends StatelessWidget {
  const Page4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Colors.white,
        child: SizedBox(
          height: 250,
          child: ListView.separated(
            padding: const EdgeInsets.all(10),
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 16,
                width: 16,
              );
            },
            itemCount: 10,
            itemBuilder: (context, index) {
              return Container(
                height: double.infinity,
                width: 175,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Text('HELLO'),
              );
            },
          ),
        ),
      ),
    );
  }
}
