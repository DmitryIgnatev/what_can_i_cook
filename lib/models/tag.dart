import 'package:what_can_i_cook/models/base_item_model.dart';

class Tag extends BaseItemModel {
  Tag({
    required super.id,
    required super.name,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
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
