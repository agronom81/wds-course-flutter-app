import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../api/server_api.dart';
import '../common/utils.dart';
import '../models/product_short.dart';
import '../widgets/custom_text.dart';
import '../widgets/explore/explore_categories.dart';
import '../widgets/explore/search.dart';
import '../widgets/loader.dart';
import '../widgets/products/products_list.dart';
import '../widgets/screen_title.dart';
import 'cart/bloc/cart_bloc.dart';
import 'cart/bloc/cart_event.dart';
import 'home/bloc/home_cubit.dart';
import 'home/bloc/home_state.dart';

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
    void addProduct(ProductShort product) async {
      context.read<CartBloc>().add(CartAddEvent(product: product));
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const ScreenTitle(
          title: 'Find Products',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 25, right: 25),
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            List<ProductShort> products = [];
            bool isProduct = false;
            if (query.length > 1) {
              products = state.products.where((element) {
                return element.name.toLowerCase().contains(query.toLowerCase());
              }).toList();
              isProduct = true;
            }

            return ListView(
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
                    : !isProduct
                        ? ExploreCategories(
                            categories: createCategory(data),
                          )
                        : ProductsList(
                            products: products,
                            action: addProduct,
                          ),
                const SizedBox(
                  height: 20,
                ),
              ],
            );
          },
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
