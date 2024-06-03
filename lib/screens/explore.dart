import 'package:flutter/material.dart';

import '../api/server_api.dart';
import '../widgets/custom_text.dart';
import '../widgets/explore/explore_categories.dart';
import '../widgets/screen_title.dart';
import '../widgets/search_field.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  ServerApi api = ServerApi();
  late dynamic data;
  late bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const ScreenTitle(
          title: 'Find Products',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 25, right: 25),
        child: ListView(
          children: [
            const SizedBox(
              height: 30,
            ),
            const SearchField(),
            const SizedBox(
              height: 25,
            ),
            isLoading
                ? const Center(
                    child: Text('Loading...'),
                  )
                : ExploreCategories(
                    categories: data,
                  ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  void _getData() {
    api.getCategories().then((value) {
      if (value.code >= 200 && value.code < 300 && value.status) {
        setState(() {
          data = value.data;
          isLoading = false;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: CustomText(
              text: value.message,
              color: Colors.white,
            ),
          ),
        );
      }
    });
  }
}
