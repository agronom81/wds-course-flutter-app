class ProductShort {
  int id;
  String name;
  String short_description;
  String preview_image;
  String price;

  ProductShort({
    required this.id,
    required this.name,
    required this.short_description,
    required this.preview_image,
    required this.price,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'short_description': short_description,
      'preview_image': preview_image
    };
  }

  factory ProductShort.fromJson(Map<String, dynamic> json) {
    return ProductShort(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      short_description: json['short_description'],
      preview_image: json['preview_image'],
    );
  }
}
