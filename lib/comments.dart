import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const MainApp());
}

class Comment {
  String id;
  String author;
  String content;

  Comment({
    required this.id,
    required this.author,
    required this.content,
  });
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  List<Comment> comments = [
    Comment(id: '1', author: 'Anonymous', content: '오류'),
    Comment(id: '2', author: 'Anonymous', content: '제발..'),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          onSubmitted: (query) {
            setState(() {
              comments = [
                Comment(
                  id: DateTime.now().toString(),
                  author: 'author',
                  content: query,
                ),
                ...comments,
              ];
            });
          },
        ),
        ...comments.map((comment) => ListTile(
              title: Text(comment.author),
              subtitle: Text(comment.content),
              trailing: IconButton(
                icon: const Icon(Icons.delete_outline),
                onPressed: () {
                  setState(() {
                    comments =
                        comments.where((c) => c.id != comment.id).toList();
                  });
                },
              ),
            ))
      ],
    );
  }
}
