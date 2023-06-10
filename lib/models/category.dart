import 'base_item_model.dart';

class RecipeCategory extends BaseItemModel {
  RecipeCategory({
    required String id,
    required String name,
  }) : super(id: id, name: name);

  factory RecipeCategory.fromJson(Map<String, dynamic> json) {
    return RecipeCategory(
      id: json['id'] ?? "",
      name: json['name'] ?? "",
    );
  }
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}
