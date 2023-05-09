class Recipe {
  final String id;
  final String name;
  final List<String> ingredients;
  final int time;
  final String pictureUrl;
  final String description;

  Recipe(
      {required this.id,
      required this.name,
      required this.ingredients,
      required this.time,
      required this.pictureUrl,
      required this.description});

  factory Recipe.fromJson(Map<String, dynamic> json) {
    var list = json['ingridients'] as List<dynamic>;
    List<String> ingredientsList = list.map((item) => item.toString()).toList();

    return Recipe(
        id: json['id'] ?? "",
        name: json['name'] ?? "",
        ingredients: ingredientsList,
        time: json["time"] ?? 0,
        pictureUrl: json['pictureUrl'] ?? '',
        description: json['description'] ?? '');
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'ingridients': ingredients,
        'time': time,
        'pictureUrl': pictureUrl,
        'description': description
      };
}
