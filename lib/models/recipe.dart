import 'base_item_model.dart';

class Recipe extends BaseItemModel {
  final List<String> ingredients;
  final int time;
  final String pictureUrl;
  final String description;
  final List<String> tags;
  final String category;

  Recipe({
    required String id,
    required String name,
    required this.ingredients,
    required this.time,
    required this.pictureUrl,
    required this.description,
    required this.tags,
    required this.category,
  }) : super(id: id, name: name);

  factory Recipe.fromJson(Map<String, dynamic> json) {
    List<dynamic> ingredientData = json['ingredients'];
    List<dynamic> tagData = json['tags'];
    List<String> ingredientsList =
        ingredientData.map((item) => item.toString()).toList();
    List<String> tagList = tagData.map((item) => item.toString()).toList();
    return Recipe(
      id: json['id'] ?? "",
      name: json['name'] ?? "",
      ingredients: ingredientsList,
      time: json["time"] ?? 0,
      pictureUrl: json['pictureUrl'] ?? '',
      description: json['description'] ?? '',
      tags: tagList,
      category: json['category'] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'ingredients': ingredients,
        'time': time,
        'pictureUrl': pictureUrl,
        'description': description,
        "tags": tags,
        "category": category
      };
}
