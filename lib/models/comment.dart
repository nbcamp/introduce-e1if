class Comment {
  String id;
  String author;
  String content;
  int _createdAt = 0;

  Comment({
    required this.id,
    required this.author,
    required this.content,
    createdAt,
  }) {
    _createdAt = createdAt ?? DateTime.now().millisecondsSinceEpoch;
  }

  DateTime get createdAt => DateTime.fromMillisecondsSinceEpoch(_createdAt);

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'author': author,
      'content': content,
      'createdAt': _createdAt,
    };
  }

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      id: json['id'],
      author: json['author'],
      content: json['content'],
      createdAt: json['createdAt'],
    );
  }
}
