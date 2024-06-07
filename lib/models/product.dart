class Product {
  int id;
  String name;
  String shortDescription;
  String description;
  List<String> images;
  String preview_image;
  String price;
  List<int> categories;
  dynamic nutritions;

  Product({
    required this.id,
    required this.name,
    required this.shortDescription,
    required this.description,
    required this.images,
    required this.preview_image,
    required this.price,
    required this.categories,
    required this.nutritions,
  });
}
