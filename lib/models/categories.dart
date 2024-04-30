import 'package:flutter/material.dart';

class Category {
  const Category({
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.color,
  });

  final int id;
  final String imageUrl;
  final String title;
  final Color color;
}
