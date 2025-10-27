class TodoItem {
  String id;
  String title;
  DateTime createdAt;
  bool isDone;

  TodoItem({
    required this.id,
    required this.title,
    required this.createdAt,
    this.isDone = false,
  });

  // para salvar/ler localmente via JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'createdAt': createdAt.toIso8601String(),
      'isDone': isDone,
    };
  }

  factory TodoItem.fromJson(Map<String, dynamic> json) {
    return TodoItem(
      id: json['id'] as String,
      title: json['title'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      isDone: json['isDone'] as bool,
    );
  }
}
