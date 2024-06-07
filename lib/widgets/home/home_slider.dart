import 'package:flutter/cupertino.dart';

import '../image_slider.dart';

class HomeSlider extends StatelessWidget {
  const HomeSlider({
    super.key,
    required this.images,
    required this.dotsBottom,
  });

  final List<String> images;
  final double dotsBottom;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 25, right: 25, bottom: 30),
      width: double.infinity,
      height: 135,
      alignment: Alignment.topCenter,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(8.0),
        ),
      ),
      child: ImageSlider(
        images: images,
        dotsBottom: dotsBottom,
        fit: 'cover',
      ),
    );
  }
}
