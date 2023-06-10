abstract class BaseItemModel {
  final String id;
  final String name;

  BaseItemModel({
    required this.id,
    required this.name,
  });

  factory BaseItemModel.fromJson(Map<String, dynamic> json) {
    throw UnimplementedError('fromJson method must be implemented');
  }

  Map<String, dynamic> toJson();
}
