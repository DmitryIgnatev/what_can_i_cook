import 'package:what_can_i_cook/models/base_item_model.dart';

class Ingredient extends BaseItemModel {
  Ingredient({
    required super.id,
    required super.name,
  });

  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
    );
  }
  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}
