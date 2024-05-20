class Offer {
  const Offer({
    required this.id,
    required this.imageUrl,
    required this.bigImageUrl,
    required this.title,
    required this.qty,
    required this.price,
  });

  final int id;
  final String imageUrl;
  final String bigImageUrl;
  final String title;
  final String qty;
  final double price;
}
