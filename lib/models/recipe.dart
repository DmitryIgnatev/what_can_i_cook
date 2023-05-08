class Recipe {
  final String id;
  final String name;
  final String ingridients;
  final int time;
  final String pictureUrl;

  Recipe({
    required this.id,
    required this.name,
    required this.ingridients,
    required this.time,
    required this.pictureUrl,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json['id'] ?? "",
      name: json['name'] ?? "",
      ingridients: json['ingridients'] ?? "",
      time: json["time"] ?? 0,
      pictureUrl: json['pictureUrl'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'ingridients': ingridients,
        'time': time,
        'pictureUrl': pictureUrl
      };
}
