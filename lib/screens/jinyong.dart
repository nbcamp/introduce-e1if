import 'package:flutter/material.dart';
import 'package:introduce_e1if/models/comment.dart';
import 'package:introduce_e1if/screens/sanghun.dart';
import 'package:introduce_e1if/widgets/comments.dart';
import 'package:introduce_e1if/widgets/header.dart';
import 'package:introduce_e1if/widgets/paragraph.dart';
import 'kia.dart'; // KiaPage를 import합니다.

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
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Header('안녕하세요!'),
                        Paragraph([
                          '취미로 개발하는 개발자 박진용입니다. 🖐️',
                          '저는 여러가지 프로그래밍 언어를 배우는 걸 좋아해요. 📚',
                        ]),
                        Paragraph([
                          '프로그래밍에 처음 흥미를 가진 이후로 C, C++, Java, Python 등 여러 가지 언어를 공부했어요. '
                              '그러다가 개발자로서 커리어를 쌓기 위해 웹 개발을 시작하여 1년 정도 웹 개발자로서 재직하며 실력을 쌓았습니다. 🚀',
                        ]),
                        Paragraph([
                          '최근에 iOS 생태계에 관심을 가지게 되어 Swift를 배워보고자 내배캠에 합류하게 되었습니다! '
                              '여러분과 함께 여러가지 프로젝트를 진행하면서 iOS 개발자로서 성장해 나가고 싶습니다. 잘 부탁드립니다! 🙇‍♂️',
                        ]),
                        Paragraph(['저에 대해서 더 궁금한 점이 있다면 댓글로 남겨주세요!! 😊']),
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
                        comments = comments
                            .where((comment) => comment.id != id)
                            .toList();
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => KiaPage()), // KiaPage로 페이지 전환
          );
        },
        backgroundColor: Colors.lightBlue[500],
        elevation: 5,
        child: Text(
          'Next',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
