import 'base_item_model.dart';

class Tag extends BaseItemModel {
  Tag({
    required String id,
    required String name,
  }) : super(id: id, name: name);

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      id: json['id'] ?? "",
      name: json['name'] ?? "",
    );
  }
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}
