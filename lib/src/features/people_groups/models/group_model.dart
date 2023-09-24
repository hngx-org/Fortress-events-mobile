class GroupModel {
  final String? id;
  final String? title;
  final String? description;

  GroupModel({
    required this.id,
    required this.title,
    required this.description,
  });

  factory GroupModel.fromJson(Map<String, dynamic> map) {
    return GroupModel(
      id: map['id'] ?? '',
      title: map['title'] as String? ?? 'Dummy Title',
      description: map['description'] as String? ?? 'Dummy Description',
    );
  }

  @override
  toString() => 'GroupModel(id: $id, name: $title, description: $description)';
}
