import 'package:cloud_firestore/cloud_firestore.dart';

class MenuDishe {
  final String? id;
  final String name;
  final int price;
  final String image;
  final String description;
  final String cookingTime;
  final String rank;
  final int number;

  const MenuDishe({
    required this.image,
    required this.name,
    required this.price,
    this.id,
    required this.description,
    required this.cookingTime,
    required this.rank,
    required this.number,
  });

  toJson() {
    return {
      "dishe_name": name,
      "dishe_price": price,
      "dishe_image": image,
      "dishe_cooking_time": cookingTime,
      "dishe_rank": rank,
      "dishe_description": description,
      "dishe_number": number,
    };
  }

  factory MenuDishe.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return MenuDishe(
      id: document.id,
      name: data['dishe_name'] ?? '',
      price: data['dishe_price'] ?? 0,
      image: data['dishe_image'] ?? '',
      description: data['dishe_description'] ?? '',
      cookingTime: data['dishe_cooking_time'].toString(),
      rank: data['dishe_rank'].toString(),
      number: data['dishe_number'] ?? 0,
    );
  }
}
