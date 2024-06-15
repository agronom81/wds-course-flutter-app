import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../api/server_api.dart';
import '../screens/home/bloc/home_cubit.dart';

class SearchField extends StatefulWidget {
  const SearchField({super.key});

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  ServerApi api = ServerApi();

  @override
  void initState() {
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    var homeState = context.watch<HomeCubit>().state;

    return Autocomplete<Map<String, dynamic>>(
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text == '') {
          return const Iterable<Map<String, dynamic>>.empty();
        }
        return homeState.productsAutocomplete
            .where((Map<String, dynamic> option) {
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
          child: Container(
            color: Colors.white,
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
    context.read<HomeCubit>().loadProducts();
  }
}
