// ignore_for_file: prefer_const_constructors, must_be_immutable
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:introduce_e1if/models/comment.dart';
import 'package:provider/provider.dart';

import '../services/comment.dart';

class GagyeomScreen extends StatelessWidget {
  GagyeomScreen({super.key});

  final TextEditingController textarea = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<CommentService>(
      builder: (context, commentService, child) {
        var UseState(:comments, :setState) = commentService.useState('장가겸');
        return Scaffold(
          appBar: AppBar(
            elevation: 100,
            leading: IconButton(
              icon: Icon(CupertinoIcons.back),
              color: Colors.black,
              onPressed: () => Navigator.pop(context),
            ),
            backgroundColor: Colors.grey[300],
            title: Text('장가겸'),
            titleTextStyle: TextStyle(color: Colors.black, fontSize: 20),
          ),
          body: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(children: [
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.grey[300]!, Colors.black],
                      ),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05),
                        ProfilePhoto(
                            "https://ca.slack-edge.com/T043597JK8V-U059UCE8EEB-6804775942c0-512"),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05),
                        Column(
                          children: [
                            Title(
                              "나에 대한 소개",
                            ),
                            Introduce(
                              "안녕하세요. E1IF의 I중 한 명을 맡고 있는 장가겸이라고 합니다. \n \n23살인 저는 1년 조금 더 된 고양이 한 마리와 함께 사는 집사랍니다ㅎ\n\n제 MBTI는 ISFP이지만, 모든게 50%에 가깝게 나와 MBTI 검사를 하면 자주 바뀐답니다! 주로 나오는건 ISFP, INFP, ENFP입니다!!",
                            ),
                            Title(
                              "객관적으로 본 나의 장점",
                            ),
                            Introduce(
                              "제 입으로 저의 장점을 말하자려니까 조금 부끄럽네요 ㅎ..\n제 장점은 두 가지인 것 같습니다.\n\n'습득력이 빠르다'라는 것과 '체력이 좋다'입니다.\n\n어릴적부터 운동을 좋아해 꾸준히 운동했던게 공부나 코딩을 하는데에 있어서 오래 엉덩이를 붙힐 수 있는 원동력이 됐습니다.\n\n그리고 수업을 들을 때 그걸 이해하고 활용하는 부분에서 빠르게 적응하고 습득하였습니다.",
                            ),
                            Title("나의 협업 스타일"),
                            Introduce(
                              "전 남에게 피해는 끼치지 말자 주의라서 제가 해야하는 것들은 어떻게든 해내는 타입이에요.\n그래서 묵묵히 제 할 일을 하는 스타일인데, 그래도 소통은 놓지 않으려합니다!",
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: TextField(
                            style: TextStyle(color: Colors.white),
                            cursorColor: Colors.white,
                            decoration: InputDecoration(
                              prefixIcon:
                                  Icon(Icons.person, color: Colors.grey),
                              hintText: "댓글을 입력해 주세요.",
                              hintStyle: TextStyle(color: Colors.white),
                              labelText: 'Anonymous',
                              labelStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  borderSide: BorderSide(color: Colors.grey)),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                            ),
                            keyboardType: TextInputType.text,
                            controller: textarea,
                            onSubmitted: (query) {
                              if (query.isEmpty) {
                                return;
                              }
                              setState(
                                () {
                                  return [
                                    Comment(
                                      id: DateTime.now().toString(),
                                      author: 'Anonymous',
                                      content: query,
                                    ),
                                    ...comments,
                                  ];
                                },
                              );
                              textarea.clear();
                            },
                          ),
                        ),
                        if (comments.isEmpty)
                          Container(
                            height: 100,
                            alignment: Alignment.center,
                            child: const Text(
                              '첫 댓글을 남겨주세요!',
                              style: TextStyle(
                                  fontSize: 14, color: Colors.black54),
                            ),
                          )
                        else
                          ...comments.map(
                            (comment) => ListTile(
                              tileColor: Colors.white,
                              leading: Icon(Icons.person, color: Colors.grey),
                              title: Text(comment.author),
                              textColor: Colors.white,
                              subtitle: Text(comment.content),
                              trailing: IconButton(
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  setState(
                                    () {
                                      return comments
                                          .where((c) => c.id != comment.id)
                                          .toList();
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ]),
              ),
            ),
          ),
        );
      },
    );
  }
}

Padding Introduce(String introduce) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    child: Container(
      alignment: Alignment.topLeft,
      child: Text(
        introduce,
        style: TextStyle(color: Colors.white70, fontSize: 15),
      ),
    ),
  );
}

Padding Title(String title) {
  return Padding(
    padding: const EdgeInsets.all(13.0),
    child: Container(
      alignment: Alignment.topLeft,
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}

Container ProfilePhoto(String url) {
  return Container(
    alignment: Alignment.center,
    width: 350,
    height: 350,
    child: Image.network(url),
  );
}
