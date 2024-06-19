import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/app_constants.dart';
import '../../models/product_extra.dart';
import '../../models/product_short.dart';
import '../../widgets/loader.dart';
import '../../widgets/products/products_list.dart';
import '../../widgets/screen_title.dart';
import '../cart/bloc/cart_bloc.dart';
import '../cart/bloc/cart_event.dart';
import 'bloc/products_cubit.dart';
import 'bloc/products_state.dart';

class Products extends StatefulWidget {
  const Products({
    super.key,
    required this.extra,
  });

  final ProductExtra? extra;

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  @override
  void initState() {
    super.initState();
    _loadProducts();
  }

  @override
  Widget build(BuildContext context) {
    void addProduct(ProductShort product) async {
      context.read<CartBloc>().add(CartAddEvent(product: product));
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: ScreenTitle(
          title: widget.extra?.title ?? 'Product',
        ),
      ),
      body: BlocBuilder<ProductsCubit, ProductsState>(
        builder: (context, state) {
          List<ProductShort> products = [];

          if (widget.extra?.type == AppConstants.exclusive) {
            products = state.exclusiveProducts;
          } else if (widget.extra?.type == AppConstants.bestSell) {
            products = state.bestSellProducts;
          } else {
            products = state.products;
          }

          return state.isLoading
              ? const Loader()
              : Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  child: !products.isNotEmpty
                      ? const Center(
                          child: Text('No any products'),
                        )
                      : ProductsList(
                          products: products,
                          action: addProduct,
                        ),
                );
        },
      ),
    );
  }

  _loadProducts() {
    if (widget.extra?.type == AppConstants.exclusive) {
      context.read<ProductsCubit>().loadExclusiveProducts();
    } else if (widget.extra?.type == AppConstants.bestSell) {
      context.read<ProductsCubit>().loadBestSellProducts();
    } else {
      context
          .read<ProductsCubit>()
          .filterCategoryProducts(widget.extra?.catId ?? '');
    }
  }
}
