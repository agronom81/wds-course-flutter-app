import 'package:flutter/material.dart';

class QtyCounter extends StatefulWidget {
  const QtyCounter({
    super.key,
    required this.setCount,
  });
  final void Function(int count) setCount;

  @override
  State<QtyCounter> createState() => _QtyCounterState();
}

class _QtyCounterState extends State<QtyCounter> {
  int count = 1;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            if (count > 1) {
              int newCount = count - 1;
              setState(() {
                count = newCount;
              });
              widget.setCount(newCount);
            }
          },
          icon: const Icon(Icons.remove),
          color: const Color.fromRGBO(179, 179, 179, 1),
        ),
        Container(
          width: 45,
          height: 45,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(17),
            ),
            border: Border.all(
              width: 1,
              color: const Color.fromRGBO(226, 226, 226, 1),
            ),
          ),
          child: Text('$count'),
        ),
        IconButton(
          onPressed: () {
            int newCount = count + 1;
            setState(() {
              count = newCount;
            });
            widget.setCount(newCount);
          },
          icon: const Icon(Icons.add),
          color: const Color.fromRGBO(83, 177, 117, 1),
        ),
      ],
    );
  }
}
