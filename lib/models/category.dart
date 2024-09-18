import 'package:what_can_i_cook/models/base_item_model.dart';

class RecipeCategory extends BaseItemModel {
  RecipeCategory({
    required super.id,
    required super.name,
  });

  factory RecipeCategory.fromJson(Map<String, dynamic> json) {
    return RecipeCategory(
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
