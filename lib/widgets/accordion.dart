import 'package:flutter/material.dart';

import '../models/offers.dart';

class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
    required this.description,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  String description;
  bool isExpanded;
}

// List<Item> generateItems(List<OfferDescription> offerList) {
//   final List<Item> result;
//
//   for (int i = 0; i < offerList.length; i++) {
//     result.add({
//
//     })
//   }
//
//   return List<Item>.generate(numberOfItems, (int index) {
//     return Item(
//       headerValue: 'Panel $index',
//       expandedValue: 'This is item number $index',
//     );
//   });
// }

// List<OfferDescription> generateItems(List<OfferDescription> offer) {
//   return List<OfferDescription>.generate(offer, (int index) {
//     return Item(
//       headerValue: offer[index].title,
//       description: offer.description,
//       expandedValue: offer.title,
//     );
//   });
//
// }

class Accordion extends StatefulWidget {
  const Accordion({
    super.key,
    required this.offerList,
  });

  final List offerList;

  @override
  State<Accordion> createState() => _AccordionState();
}

class _AccordionState extends State<Accordion> {
  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList();
  }
}
