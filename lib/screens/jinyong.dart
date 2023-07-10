import 'package:flutter/material.dart';
import 'package:introduce_e1if/models/comment.dart';
import 'package:introduce_e1if/widgets/comments.dart';

class JinyongScreen extends StatefulWidget {
  const JinyongScreen({super.key});

  @override
  State<JinyongScreen> createState() => _JinyongScreenState();
}

class _JinyongScreenState extends State<JinyongScreen> {
  List<Comment> comments = [
    Comment(id: '1', author: 'Anonymous', content: '안녕하세요!'),
    Comment(id: '2', author: 'Anonymous', content: '잘부탁해요!'),
    Comment(id: '3', author: 'Anonymous', content: '좋은 글이네요!'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    title('안녕하세요!'),
                    paragraph([
                      '취미로 개발하는 개발자 박진용입니다. 🖐️',
                      '',
                      '',
                    ]),
                    title('나의 장점'),
                    paragraph([
                      '1. ',
                      '2. ',
                    ]),
                    title('잘하는 것'),
                    paragraph([
                      '1. ',
                      '2. ',
                      '3. ',
                    ]),
                    // paragraph(['저에 대해서 더 궁금한 점이 있다면 댓글을 남겨주세요!']),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Comments(
                comments: comments,
                onSubmit: (query) {
                  if (query.isEmpty) {
                    return;
                  }
                  setState(() {
                    comments = [
                      Comment(
                        id: DateTime.now().toString(),
                        author: 'Anonymous',
                        content: query,
                      ),
                      ...comments,
                    ];
                  });
                },
                onDelete: (id) {
                  setState(() {
                    comments =
                        comments.where((comment) => comment.id != id).toList();
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget title(String content) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 10),
      child: Text(
        content,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget paragraph(List<String> content, {String separator = '\n'}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        content.join(separator),
        style: const TextStyle(
          fontSize: 14,
        ),
      ),
    );
  }
}
