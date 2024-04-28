class Coffee {
  late String name, description, category, image;
  late double price;
  late int volume;
  bool isFavourite = false;

  Coffee({
    required this.image,
    required this.name,
    required this.category,
    required this.description,
    required this.price,
    required this.volume,
  });
}
