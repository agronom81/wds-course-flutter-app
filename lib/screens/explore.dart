import 'package:flutter/material.dart';

import '../api/server_api.dart';
import '../common/utils.dart';
import '../widgets/custom_text.dart';
import '../widgets/explore/explore_categories.dart';
import '../widgets/explore/search.dart';
import '../widgets/loader.dart';
import '../widgets/screen_title.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  ServerApi api = ServerApi();
  late dynamic data;
  late bool isLoading = true;
  late String query = '';

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
            Search(
              searchQuery: setQuery,
            ),
            const SizedBox(
              height: 25,
            ),
            isLoading
                ? const Loader()
                : ExploreCategories(
                    categories: createCategory(data),
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
      if (value.isSuccess) {
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

  void setQuery(String value) {
    setState(() {
      query = value;
    });
  }
}
