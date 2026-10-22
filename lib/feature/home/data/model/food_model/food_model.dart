class FoodModel {
  final String name;
  final int id;
  final String image;
  final double rating;
  final num price;
  final List<String>? instructions;

  FoodModel({
    required this.name,
    required this.id,
    required this.image,
    required this.rating,
    required this.price,
    this.instructions,
  });
  factory FoodModel.fromJson(Map<String, dynamic> json) {
    return FoodModel(
      name: json['name'],
      id: json['id'],
      image: json['image'],
      rating: (json['rating'] as num).toDouble(),
      price: (10 + (json['id'] * 1.5)),
      instructions: json['instructions'] != null
          ? List<String>.from(json['instructions'])
          : null,
    );
  }
}
