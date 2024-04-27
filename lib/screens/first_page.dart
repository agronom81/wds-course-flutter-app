import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  PageController controller = PageController();

  @override
  void initState() {
    controller.addListener(() {
      print(controller.page);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Container(
          color: Colors.grey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: 200,
                  height: 500,
                  color: getColor(1),
                  child: const Center(child: Text('TEXT - 1')),
                ),
                Container(
                  width: 200,
                  height: 500,
                  color: getColor(2),
                  child: const Center(child: Text('TEXT - 2')),
                ),
              ],
            ),
          ),
        ));
  }

  Color getColor(int index) {
    if (index == 0) {
      return Colors.red;
    }

    if (index == 1) {
      return Colors.green;
    }

    if (index == 2) {
      return Colors.yellow;
    }

    return Colors.white54;
  }
}
