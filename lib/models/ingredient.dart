class Ingredient {
  final String id;
  final String ingredient;

  Ingredient({
    required this.id,
    required this.ingredient,
  });

  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(
      id: json['id'] ?? "",
      ingredient: json['ingredient'] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'ingredient': ingredient,
      };
}
