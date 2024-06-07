import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../api/server_api.dart';
import '../common/app_preferences.dart';
import '../common/utils.dart';
import '../widgets/empty.dart';
import '../widgets/home/home_categories.dart';
import '../widgets/home/home_products.dart';
import '../widgets/home/home_slider.dart';
import '../widgets/loader.dart';
import '../widgets/search_field.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
        backgroundColor: Colors.white,
        foregroundColor: Colors.white,
      ),
      body: isLoading
          ? const Loader()
          : HomeContent(
              data: data,
            ),
    );
  }

  void _getData() {
    api.getHome().then((value) {
      if (value.code >= 200 && value.code < 300 && value.status) {
        setState(() {
          data = value.data;
          isLoading = false;
        });
      } else {
        AppPreferences.removeToken();
        context.go('/');
      }
    });
  }
}

class HomeContent extends StatelessWidget {
  final Map<String, dynamic> data;

  const HomeContent({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          SizedBox(
            height: 50,
            child: SvgPicture.asset(
              'icons/carrot.svg',
              height: 40,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
            child: SearchField(),
          ),
          data['slider'] != null && data['slider'].length > 0
              ? HomeSlider(
                  images: data['slider'].cast<String>(),
                  dotsBottom: 8,
                )
              : const Empty(),
          data['exclusive'] != null && data['exclusive'].length > 0
              ? HomeProducts(
                  products: createProductShort(data['exclusive']),
                  routeName: 'explore',
                  blockTitle: 'Exclusive Offer',
                )
              : const Empty(),
          data['best'] != null && data['best'].length > 0
              ? HomeProducts(
                  products: createProductShort(data['best']),
                  routeName: 'explore',
                  blockTitle: 'Best Selling',
                )
              : const Empty(),
          data['category'] != null && data['category'].length > 0
              ? HomeCategories(
                  categories: createCategory(data['category']),
                )
              : const Empty(),
        ],
      ),
    );
  }
}
