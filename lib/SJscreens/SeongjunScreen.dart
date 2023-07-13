import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:introduce_e1if/services/comment.dart';
import 'package:provider/provider.dart';

import 'comments.dart';
import 'feed.dart';

class SeongjunScreen extends StatelessWidget {
  const SeongjunScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CommentService>(builder: (context, commentService, child) {
      var UseState(:comments, :setState) = commentService.useState('원성준');
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () => Navigator.pop(context),
                color: Colors.black54,
                icon: const Icon(CupertinoIcons.back),
              ),
              SizedBox(width: 10),
              Text(
                '원성준',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                  fontSize: 25,
                ),
              ),
            ],
          ),
          leadingWidth: 140,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(CupertinoIcons.heart, color: Colors.black54),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Feed(
                imageUrl: 'https://i.ibb.co/Wkrx5vp/1.jpg',
                title: '나의 소개',
                main: '안녕하세요, E1IF 에서 3대500이 되고 싶은 비전공 개발자 원성준 입니다!',
                main2: '',
              ),
              Feed(
                imageUrl: 'https://i.ibb.co/kg8ZVh3/2.jpg',
                title: 'MBTI',
                main: '성격유형이 수호자인 "ISFJ"',
                main2: 'I,S,J 는 맞는데 제 생각엔 F 55%, T 45% 에요ㅎㅎ',
              ),
              Feed(
                imageUrl: 'https://i.ibb.co/9NqXGKp/3.jpg',
                title: '나의 장점, 협업스타일',
                main: '안풀리는 부분이 있다면 해결할때까지 앉아있어요!',
                main2:
                    '소통하는 것을 좋아하고 궁금한 것이 있다면 어떻게든 물어보려고 하고 제가 더 아는게 있다면 잘 알려주고 싶어합니다!',
              ),
              Feed(
                imageUrl: 'https://i.ibb.co/64ksx4Q/4.jpg',
                title: 'TMI',
                main: '드라마나 영화에서 누가 울면 따라서 눈물이 나요ㅠ(확실히 F)',
                main2: '고양이를 너무 좋아해서 고양이만 보면 발걸음을 멈춰요.',
              ),
              MainApp()
            ],
          ),
        ),
      );
    });
  }
}
