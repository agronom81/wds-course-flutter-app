import 'package:wds_first_app/models/product_short.dart';

class OrderProductShort extends ProductShort {
  int quantity;

  OrderProductShort({
    required this.quantity,
    required super.id,
    required super.name,
    required super.short_description,
    required super.preview_image,
    required super.price,
  });
}
