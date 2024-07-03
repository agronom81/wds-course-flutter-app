import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wds_first_app/widgets/orders/order_card.dart';

import '../../screens/orders/bloc/orders_cubit.dart';
import '../../screens/orders/bloc/orders_state.dart';

class OrdersList extends StatefulWidget {
  const OrdersList({super.key});

  @override
  State<OrdersList> createState() => _OrdersListState();
}

class _OrdersListState extends State<OrdersList> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    context.read<OrdersCubit>().getOrders();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        context.read<OrdersCubit>().getOrders();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrdersCubit, OrdersState>(
      builder: (context, state) {
        if (!state.isSuccess) {
          return Center(child: Text(state.message));
        } else if (state.isLoading && state.page == 1) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: ListView.builder(
              controller: _scrollController,
              itemCount: state.orders.length,
              itemBuilder: (context, index) {
                final item = state.orders[index];
                return OrderCard(
                  order: item,
                  isLoading: index + 1 == state.orders.length
                      ? state.isLoading
                      : false,
                );
              },
            ),
          );
        }
      },
    );
  }
}
