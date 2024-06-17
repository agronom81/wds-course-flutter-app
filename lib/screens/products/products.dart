import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/product_short.dart';
import '../../widgets/loader.dart';
import '../../widgets/products/products_list.dart';
import '../../widgets/screen_title.dart';
import '../cart/bloc/cart_bloc.dart';
import '../cart/bloc/cart_event.dart';
import 'bloc/products_cubit.dart';
import 'bloc/products_state.dart';

class Products extends StatefulWidget {
  const Products({super.key});

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
        title: const ScreenTitle(
          title: 'Products',
        ),
      ),
      body: BlocBuilder<ProductsCubit, ProductsState>(
        builder: (context, state) {
          return state.isLoading
              ? const Loader()
              : Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  child: ProductsList(
                    products: state.products,
                    action: addProduct,
                  ),
                );
        },
      ),
    );
  }

  _loadProducts() {
    context.read<ProductsCubit>().loadProducts();
  }
}
