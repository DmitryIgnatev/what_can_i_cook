import 'base_item_model.dart';

class Ingredient extends BaseItemModel {
  Ingredient({
    required String id,
    required String name,
  }) : super(id: id, name: name);

  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(
      id: json['id'] ?? "",
      name: json['name'] ?? "",
    );
  }
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}
