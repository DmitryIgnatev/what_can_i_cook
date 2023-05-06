class Recipe {
  final String name;
  final String ingridients;
  final int time;
  final String pictureUrl;

  Recipe({
    required this.name,
    required this.ingridients,
    required this.time,
    required this.pictureUrl,
  });

  factory Recipe.formJson(Map<String, dynamic> json) {
    return Recipe(
      name: json['name'] ?? "",
      ingridients: json['ingridients'] ?? "",
      time: json["time"] ?? 0,
      pictureUrl: json['pictureUrl'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'ingridients': ingridients,
        'time': time,
        'pictureUrl': pictureUrl
      };
}
