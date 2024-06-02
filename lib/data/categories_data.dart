import 'package:flutter/material.dart';
import 'package:wds_first_app/models/categories.dart';

import '../common/color_apis.dart';

List<Category> categories = [
  Category(
    id: 1,
    imageUrl: 'https://picsum.photos/100?image=292',
    title: 'Organic',
    color: HexColor.fromHex('#b74093'),
  ),
  Category(
    id: 2,
    imageUrl: 'https://picsum.photos/100?image=429',
    title: 'Fruits',
    color: Colors.blue.shade200,
  ),
  Category(
    id: 3,
    imageUrl: 'https://picsum.photos/100?image=627',
    title: 'Berries',
    color: Colors.green.shade200,
  ),
];

List<Category> categoriesList = [
  Category(
    id: 1,
    imageUrl: 'https://picsum.photos/100?image=292',
    title: 'Fresh Fruits & Vegetable',
    color: Colors.orange.shade200,
  ),
  Category(
    id: 2,
    imageUrl: 'https://picsum.photos/100?image=429',
    title: 'Cooking Oil & Ghee',
    color: Colors.blue.shade200,
  ),
  Category(
    id: 3,
    imageUrl: 'https://picsum.photos/100?image=627',
    title: 'Meat & Fish',
    color: Colors.green.shade200,
  ),
  Category(
    id: 4,
    imageUrl: 'https://picsum.photos/100?image=292',
    title: 'Bakery & Snacks',
    color: Colors.orange.shade200,
  ),
  Category(
    id: 5,
    imageUrl: 'https://picsum.photos/100?image=429',
    title: 'Dairy & Eggs',
    color: Colors.blue.shade200,
  ),
  Category(
    id: 6,
    imageUrl: 'https://picsum.photos/100?image=627',
    title: 'Beverages',
    color: Colors.green.shade200,
  ),
  Category(
    id: 7,
    imageUrl: 'https://picsum.photos/100?image=292',
    title: 'Organic',
    color: Colors.orange.shade200,
  ),
  Category(
    id: 8,
    imageUrl: 'https://picsum.photos/100?image=429',
    title: 'Fruits',
    color: Colors.blue.shade200,
  ),
];
