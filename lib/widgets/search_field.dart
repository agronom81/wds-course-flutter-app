import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  static const List<String> _kOptions = <String>[
    'apple',
    'banana',
    'orange',
    'mango',
    'grapes',
    'watermelon',
    'kiwi',
    'strawberry',
    'sugarcane',
  ];

  @override
  Widget build(BuildContext context) {
    return Autocomplete<String>(
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text == '') {
          return const Iterable<String>.empty();
        }
        return _kOptions.where((String option) {
          return option.contains(textEditingValue.text.toLowerCase());
        });
      },
      fieldViewBuilder: (
        context,
        textEditingController,
        focusNode,
        onFieldSubmitted,
      ) {
        return TextField(
          focusNode: focusNode,
          controller: textEditingController,
          onEditingComplete: onFieldSubmitted,
          decoration: const InputDecoration(
            filled: true,
            fillColor: Color.fromRGBO(242, 243, 242, 1),
            hintText: 'Search Store',
            prefixIcon: Icon(Icons.search),
            disabledBorder: UnderlineInputBorder(),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
              borderSide: BorderSide.none,
            ),
          ),
        );
      },
      optionsViewBuilder: ((context, onSelected, options) {
        return Material(
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 20),
            itemBuilder: (BuildContext context, int index) {
              final option = options.elementAt(index);
              return ListTile(
                title: Text(option),
                onTap: () {
                  onSelected(option);
                },
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const Divider(
                color: Colors.white,
              );
            },
            itemCount: options.length,
          ),
        );
      }),
      onSelected: (String selection) {
        debugPrint(selection);
      },
      displayStringForOption: ((option) => option),
    );
  }
}
