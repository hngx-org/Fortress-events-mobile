class GroupModel {
  final String? id;
  final String? name;
  final String? description;

  GroupModel({
    required this.id,
    required this.name,
    required this.description,
  });

  factory GroupModel.fromJson(Map<String, dynamic> map) {
    return GroupModel(
      id: map['id'] ?? '',
      name: map['title'] as String?,
      description: map['description'] as String?,
    );
  }

  @override
  toString() => 'GroupModel(id: $id, name: $name, description: $description)';
}
