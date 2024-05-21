class OfferDescription {
  OfferDescription({
    required this.title,
    required this.description,
  });

  String title;
  String description;
}

class Offer {
  const Offer({
    required this.id,
    required this.imageUrl,
    required this.bigImageUrl,
    required this.title,
    required this.qty,
    required this.price,
    required this.description,
  });

  final int id;
  final String imageUrl;
  final String bigImageUrl;
  final String title;
  final String qty;
  final double price;
  final List<OfferDescription> description;
}
