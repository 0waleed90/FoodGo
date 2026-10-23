class FoodModel {
  final String name;
  final int id;
  final String image;
  final double rating;
  final num price;
  final List<String>? instructions;
  final int reviewCount;
  int quantity;

  FoodModel({
    required this.name,
    required this.id,
    required this.image,
    required this.rating,
    required this.price,
    this.instructions,
    this.quantity = 1,
    required this.reviewCount,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'id': id,
      'image': image,
      'rating': rating,
      'price': price,
      'instructions': instructions,
      'quantity': quantity,
      'reviewCount': reviewCount,
    };
  }

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
      quantity: json['quantity'] ?? 1,
      reviewCount: json['reviewCount']??0,
    );
  }
}
