import '../models/category.dart';
import '../models/product.dart';
import '../models/product_short.dart';

dynamic getValue(data, key) {
  if (data is Map && data.containsKey(key)) {
    return data[key];
  }

  return null;
}

String clearName(dynamic name) {
  if (name == null) return '';
  return name.replaceAll('&amp;', '&');
}

List<ProductShort> createProductShort(List<dynamic> products) {
  List<ProductShort> productShorts = [];

  if (products.isNotEmpty) {
    for (var product in products) {
      productShorts.add(ProductShort(
        id: product['id'],
        name: product['name'],
        price: product['price'],
        short_description: product['short_description'],
        preview_image: product['preview_image'],
      ));
    }
  }

  return productShorts;
}

List<Category> createCategory(List<dynamic> categoriesList) {
  List<Category> categories = [];

  if (categoriesList.isNotEmpty) {
    for (var category in categoriesList) {
      categories.add(Category(
        id: category['id'],
        name: category['name'],
        icon: category['icon'],
        color: category['color'],
      ));
    }
  }

  return categories;
}

Product createProduct(dynamic productFull) {
  Product product = Product(
    id: productFull['id'],
    name: productFull['name'],
    price: productFull['price'],
    shortDescription: productFull['shortDescription'],
    description: productFull['description'],
    preview_image: productFull['preview_image'],
    images: productFull['images'].cast<String>(),
    categories: productFull['categories'].cast<int>(),
    nutritions: productFull['nutritions'],
  );

  return product;
}
