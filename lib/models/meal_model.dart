import 'dart:convert';

class Meal {
  String title;
  String subTitle;
  String imageUrl;
  double price;
  bool isFavorite;
  Meal({
    required this.title,
    required this.subTitle,
    required this.imageUrl,
    required this.price,
    this.isFavorite = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'subTitle': subTitle,
      'imageUrl': imageUrl,
      'price': price,
      'isFavorite': isFavorite,
    };
  }

  factory Meal.fromMap(Map<String, dynamic> map) {
    return Meal(
      title: map['title'],
      subTitle: map['subTitle'],
      imageUrl: map['imageUrl'],
      price: map['price'],
      isFavorite: map['isFavorite'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Meal.fromJson(String source) => Meal.fromMap(json.decode(source));
}
