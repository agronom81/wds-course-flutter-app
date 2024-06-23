import 'package:flutter/material.dart';

class QtyCounter extends StatefulWidget {
  const QtyCounter({
    super.key,
    required this.setCount,
    this.initialCount = 1,
    this.inverse = false,
  });
  final void Function(int count) setCount;
  final int initialCount;
  final bool inverse;

  @override
  State<QtyCounter> createState() => _QtyCounterState();
}

class _QtyCounterState extends State<QtyCounter> {
  late int count;

  @override
  void initState() {
    super.initState();
    count = widget.initialCount;
  }

  @override
  Widget build(BuildContext context) {
    BoxDecoration decoration = BoxDecoration(
      borderRadius: const BorderRadius.all(
        Radius.circular(17),
      ),
      border: Border.all(
        width: 1,
        color: const Color.fromRGBO(226, 226, 226, 1),
      ),
    );

    BoxDecoration inverseDecoration = const BoxDecoration(
      borderRadius: BorderRadius.all(
        Radius.circular(17),
      ),
    );

    return Row(
      children: [
        InkWell(
          borderRadius: const BorderRadius.all(
            Radius.circular(17),
          ),
          onTap: () {
            if (count > 1) {
              int newCount = count - 1;
              setState(() {
                count = newCount;
              });
              widget.setCount(newCount);
            }
          },
          child: Container(
            width: 45,
            height: 45,
            alignment: Alignment.center,
            decoration: widget.inverse ? decoration : inverseDecoration,
            child: const Icon(Icons.remove),
          ),
        ),
        const SizedBox(width: 2),
        Container(
          width: widget.inverse ? 35 : 45,
          height: 45,
          alignment: Alignment.center,
          decoration: widget.inverse ? inverseDecoration : decoration,
          child: Text(
            '$count',
            style: TextStyle(
              fontSize: widget.inverse ? 16 : 18,
            ),
          ),
        ),
        const SizedBox(width: 2),
        InkWell(
          borderRadius: const BorderRadius.all(
            Radius.circular(17),
          ),
          onTap: () {
            int newCount = count + 1;
            setState(() {
              count = newCount;
            });
            widget.setCount(newCount);
          },
          child: Container(
            width: 45,
            height: 45,
            alignment: Alignment.center,
            decoration: widget.inverse ? decoration : inverseDecoration,
            child: const Icon(
              Icons.add,
              color: Color.fromRGBO(83, 177, 117, 1),
            ),
          ),
        ),
      ],
    );
  }
}
