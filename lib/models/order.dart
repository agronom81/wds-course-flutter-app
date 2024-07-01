import 'order_product_short.dart';

class Order {
  int id;
  String total;
  String status;
  List<OrderProductShort> products;

  Order({
    required this.id,
    required this.total,
    required this.status,
    required this.products,
  });
}
