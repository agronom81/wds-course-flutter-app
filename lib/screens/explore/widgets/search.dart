import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  const Search({
    super.key,
    required this.searchQuery,
  });

  final void Function(String value) searchQuery;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        searchQuery(value);
      },
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
  }
}
