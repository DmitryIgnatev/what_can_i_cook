class Tag {
  final String id;
  final String tag;

  Tag({
    required this.id,
    required this.tag,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      id: json['id'] ?? "",
      tag: json['tag'] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'tag': tag,
      };
}
