import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../api/server_api.dart';
import '../common/utils.dart';

class SearchField extends StatefulWidget {
  const SearchField({super.key});

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  ServerApi api = ServerApi();
  late List<Map<String, dynamic>> options = [
    {'id': 0, 'name': ''}
  ];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return Autocomplete<Map<String, dynamic>>(
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text == '') {
          return const Iterable<Map<String, dynamic>>.empty();
        }
        return options.where((Map<String, dynamic> option) {
          return option['name']
              .toLowerCase()
              .contains(textEditingValue.text.toLowerCase());
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
              return InkWell(
                child: Text(
                  option['name'],
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
                onTap: () {
                  onSelected(option);
                },
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return Divider(
                color: Colors.white.withOpacity(0),
              );
            },
            itemCount: options.length,
          ),
        );
      }),
      onSelected: (Map<String, dynamic> selection) {
        dynamic id = selection['id'];
        context.push('/product/$id');
      },
      displayStringForOption: ((option) => option['name']),
    );
  }

  void _getData() {
    api.getProducts().then((value) {
      if (value.isSuccess) {
        List<Map<String, dynamic>> productOptions = [];
        dynamic products = getValue(value.data, 'products');
        if (products != null && products.length > 0) {
          for (dynamic product in products) {
            productOptions.add({
              'id': product['id'],
              'name': product['name'],
            });
          }
          setState(() {
            options = productOptions;
          });
        }
      }
    });
  }
}
