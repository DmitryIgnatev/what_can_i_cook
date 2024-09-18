import 'package:what_can_i_cook/models/base_item_model.dart';

class Recipe extends BaseItemModel {
  final List<String> ingredients;
  final int time;
  final String pictureUrl;
  final String description;
  final List<String> tags;
  final String category;

  Recipe({
    required super.id,
    required super.name,
    required this.ingredients,
    required this.time,
    required this.pictureUrl,
    required this.description,
    required this.tags,
    required this.category,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    final List<dynamic> ingredientData = json['ingredients'];
    final List<dynamic> tagData = json['tags'];
    final List<String> ingredientsList =
        ingredientData.map((item) => item.toString()).toList();
    final List<String> tagList = tagData.map((item) => item.toString()).toList();
    return Recipe(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      ingredients: ingredientsList,
      time: json['time'] ?? 0,
      pictureUrl: json['pictureUrl'] ?? '',
      description: json['description'] ?? '',
      tags: tagList,
      category: json['category'] ?? '',
    );
  }

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'ingredients': ingredients,
        'time': time,
        'pictureUrl': pictureUrl,
        'description': description,
        'tags': tags,
        'category': category,
      };
}
