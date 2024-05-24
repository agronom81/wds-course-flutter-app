import 'package:flutter/material.dart';
import 'package:wds_first_app/widgets/custom_text.dart';

import '../common/app_color.dart';
import '../models/offers.dart';

class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
    required this.description,
    this.weight = '',
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  String description;
  String weight;
  bool isExpanded;
}

List<Item> generateItems(List<OfferDescription> offerDescription) {
  final List<Item> result = [];

  for (int i = 0; i < offerDescription.length; i++) {
    final item = Item(
      expandedValue: offerDescription[i].title,
      headerValue: offerDescription[i].title,
      description: offerDescription[i].description,
      weight: offerDescription[i].weight ?? '',
    );
    result.add(item);
  }
  return result;
}

class Accordion extends StatefulWidget {
  const Accordion({
    super.key,
    required this.offerDescription,
  });

  final List<OfferDescription> offerDescription;

  @override
  State<Accordion> createState() => _AccordionState();
}

class _AccordionState extends State<Accordion> {
  late List<Item> _data = [];

  @override
  void initState() {
    _data = generateItems(widget.offerDescription);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ExpansionPanelList(
          dividerColor: const Color.fromRGBO(255, 255, 255, 0),
          elevation: 0,
          expansionCallback: (int index, bool isExpanded) {
            setState(() {
              _data[index].isExpanded = isExpanded;
            });
          },
          children: _data.map<ExpansionPanel>((Item item) {
            return ExpansionPanel(
              canTapOnHeader: true,
              headerBuilder: (BuildContext context, bool isExpanded) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: item.headerValue,
                      fontWeight: FontWeight.w600,
                    ),
                    if (item.weight != '')
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 2,
                          horizontal: 6,
                        ),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5.0),
                          ),
                          color: Color.fromRGBO(235, 235, 235, 1),
                        ),
                        child: CustomText(
                          text: item.weight,
                          color: AppColor.textColor,
                          fontSize: 9,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                  ],
                );
              },
              body: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: CustomText(
                  text: item.description,
                  color: AppColor.textColor,
                  fontSize: 13,
                ),
              ),
              isExpanded: item.isExpanded,
            );
          }).toList(),
        ),
      ],
    );
  }
}
