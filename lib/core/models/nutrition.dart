class Nutrition {
  String name;
  String value;

  Nutrition({
    required this.name,
    required this.value,
  });

  factory Nutrition.fromMap(Map<String, dynamic> map) {
    return Nutrition(
      name: map['name'],
      value: map['value'],
    );
  }
}
