import 'package:flutter/material.dart';
import 'package:wds_first_app/common/utils.dart';
import 'package:wds_first_app/widgets/product/single_product.dart';

import '../api/server_api.dart';
import '../widgets/custom_text.dart';
import '../widgets/loader.dart';

class Product extends StatefulWidget {
  const Product({
    super.key,
    required this.id,
  });
  final String id;

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  ServerApi api = ServerApi();
  late dynamic data;
  late bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _getData(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        backgroundColor: const Color.fromRGBO(242, 242, 242, 1),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.upload,
              color: Color.fromRGBO(24, 23, 37, 1),
            ),
          ),
        ],
      ),
      body: isLoading
          ? const Loader()
          : SingleProduct(product: createProduct(data)),
    );
  }

  void _getData(dynamic id) {
    api.getProduct(id: id).then((value) {
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
