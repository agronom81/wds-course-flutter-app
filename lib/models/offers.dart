class OfferDescription {
  OfferDescription({
    required this.title,
    required this.description,
    this.weight = '',
  });

  String title;
  String description;
  String weight;
}

class Offer {
  const Offer({
    required this.id,
    required this.imageUrl,
    required this.images,
    required this.title,
    required this.qty,
    required this.price,
    required this.description,
  });

  final int id;
  final String imageUrl;
  final List<String> images;
  final String title;
  final String qty;
  final double price;
  final List<OfferDescription> description;
}

class ExclusiveOffer {
  const ExclusiveOffer({
    required this.id,
    required this.name,
    required this.short_description,
    required this.preview_image,
    required this.price,
  });

  final int id;
  final String name;
  final String short_description;
  final String preview_image;
  final String price;
}
