class Comment {
  String id;
  String author;
  String content;

  Comment({
    required this.id,
    required this.author,
    required this.content,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'author': author,
      'content': content,
    };
  }

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      id: json['id'],
      author: json['author'],
      content: json['content'],
    );
  }
}
