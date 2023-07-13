import 'package:flutter/material.dart';
import 'package:introduce_e1if/widgets/comments.dart';
import 'package:provider/provider.dart';

import '../models/comment.dart';
import '../services/comment.dart';

class KiaPage extends StatefulWidget {
  const KiaPage({Key? key}) : super(key: key);

  @override
  _KiaPageState createState() => _KiaPageState();
}

class _KiaPageState extends State<KiaPage> {
  Widget buildProfileSection() {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: SizedBox(
            child: Image.network(
              'https://ca.slack-edge.com/T043597JK8V-U05D6G5MADS-4ec3ce18cdf8-512',
              width: 130,
              height: 130,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(width: 30),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '안녕하세요.',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Text(
              'Front-end 개발자로 ',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Text(
              '활동하고 있는 김귀아입니다',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }

  Widget buildSectionContent(String content, Color backgroundColor) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Text(
          content,
          style: TextStyle(
            fontSize: 20,
            color: Colors.black87,
          ),
        ),
      ),
      width: 350,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: backgroundColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CommentService>(builder: (context, commentService, child) {
      var UseState(:comments, :setState) = commentService.useState('박진용');
      return Scaffold(
        appBar: AppBar(
          title: Text(
            'Introduction page',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Color.fromRGBO(7, 25, 82, 1),
        ),
        body: Container(
          color: Color.fromRGBO(184, 214, 248, 0.6),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 50, left: 30, right: 30, bottom: 30),
              child: Column(
                children: [
                  buildProfileSection(),
                  SizedBox(height: 50),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildSectionTitle('일본'),
                      SizedBox(height: 10),
                      buildSectionContent(
                        '일본에서 사회복지를 공부했습니다',
                        Colors.white,
                      ),
                      SizedBox(height: 25),
                      buildSectionTitle('한국'),
                      SizedBox(height: 10),
                      buildSectionContent(
                        '연구원로 3년의 경험을 쌓고',
                        Color.fromRGBO(164, 202, 245, 1),
                      ),
                      SizedBox(height: 20),
                      buildSectionContent(
                        '개발자로 커리어 전환을 했습니다.',
                        Color.fromRGBO(164, 202, 245, 1),
                      ),
                      SizedBox(height: 20),
                      buildSectionContent(
                        '여전히 배워야할게 많네요 ',
                        Color.fromRGBO(164, 202, 245, 1),
                      ),
                      SizedBox(height: 20),
                      Comments(
                        comments: comments,
                        onSubmit: (query) {
                          if (query.isEmpty) {
                            return;
                          }

                          setState(() {
                            return [
                              Comment(
                                id: DateTime.now().toString(),
                                author: '익명이',
                                content: query,
                              ),
                              ...comments,
                            ];
                          });
                        },
                        onDelete: (id) {
                          setState(() {
                            return comments
                                .where((comment) => comment.id != id)
                                .toList();
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
