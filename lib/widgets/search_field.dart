import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {},
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
