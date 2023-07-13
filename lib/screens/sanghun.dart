// ignore_for_file: prefer_const_constructors, must_be_immutable
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SanghunScreen extends StatefulWidget {
  const SanghunScreen({Key? key}) : super(key: key);

  @override
  _SanghunScreenState createState() => _SanghunScreenState();
}

class _SanghunScreenState extends State<SanghunScreen> {
  // FocusNode textFocus = FocusNode(); // TODO : 다른곳 터치하면 텍스트필드 포커스 비활성화되도록..
  TextEditingController commentController =
      TextEditingController(); // TextField에 입력된 값을 가지고 오는 클래스

  List<Comment> comments = [
    Comment(id: '1', content: '테스트1', dateTime: DateTime.now()),
    Comment(id: '2', content: '테[스트테스트테스트테스트', dateTime: DateTime.now()),
    Comment(id: '3', content: 'ㅁㄴㅇㅁㄴㅇㄹㅁㄴㅇㅁㄴㅇㅁㄴㅇ', dateTime: DateTime.now()),
  ];
  String formatDate(DateTime dateTime) {
    return '${dateTime.year}/${dateTime.month}/${dateTime.day} ${dateTime.hour}:${dateTime.minute}'; // dateTime 포맷 가공
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          color: Colors.black,
          icon: const Icon(CupertinoIcons.back),
        ),
        title: const Text("내 소개", style: TextStyle(color: Colors.black)),
      ),
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(30.0),
          children: [
            Row(
              children: [
                Container(
                  width: 150,
                  height: 150,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                        'https://1.bp.blogspot.com/-3woIFWz1_Zk/WvQH8sRKO_I/AAAAAAABL-4/tPcqQau8EQQTWxbOA2Y_ZCjii2HGZ85TQCLcBGAs/s400/torokko_trolley_rail_businessman.png',
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 30),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "김상훈",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "서울 관악구\nsanc93@me.com",
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 30),
            ListView(
              shrinkWrap: true, // ListView가 필요한 공간만 차지하도록
              physics: const ScrollPhysics(),
              children: [
                Text(
                  ' 특기',
                ),
                SizedBox(height: 10),
                TileBox(
                  title: '수영',
                  tileColor: Color.fromARGB(255, 255, 116, 106),
                ),
                SizedBox(height: 30),
                Text(' 나의장점'),
                SizedBox(height: 10),
                TileBox(
                  title: '모든 일에 긍정적입니다',
                ),
                SizedBox(height: 10),
                TileBox(
                  title: '문제가 생겨도 포기하지 않습니다',
                ),
                SizedBox(height: 10),
                TileBox(
                  title: '새로운 것에 도전하는 것을 좋아합니다',
                ),
                SizedBox(height: 30),
                Divider(),
                SizedBox(height: 10),
                Flexible(
                  // TODO: 댓글 기능
                  child: Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 40.0,
                          child: TextField(
                            controller: commentController,
                            style: TextStyle(
                                fontSize: 13.0,
                                height: 1.2,
                                color: Colors.black),
                            onSubmitted: (query) {
                              setState(() {
                                comments = [
                                  Comment(
                                    id: DateTime.now().toString(),
                                    content: query,
                                    dateTime: DateTime.now(),
                                  ),
                                  ...comments,
                                ];
                              });
                            },
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 15),
                              hintText: '댓글을 입력하세요',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              fillColor: Colors.black12,
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.black87, width: 1.0),
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 2),
                      ElevatedButton(
                        onPressed: () {
                          String comment = commentController.text.trim();
                          if (comment.isNotEmpty) {
                            setState(() {
                              comments.insert(
                                0,
                                Comment(
                                  id: DateTime.now().toString(),
                                  content: comment,
                                  dateTime: DateTime.now(),
                                ),
                              );
                            });
                            commentController.clear();
                          }
                          print('test1111');
                        },
                        child: Icon(
                          Icons.keyboard_return_rounded,
                          size: 18,
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black38,
                          shape: CircleBorder(),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 10),
                if (comments.isEmpty)
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text('아직 댓글이 없습니다', textAlign: TextAlign.center),
                  ),
                ...comments.map((comment) => ListTile(
                      title: Row(
                        children: [
                          Expanded(
                            child: Text(
                              comment.content,
                              overflow: TextOverflow
                                  .visible, // 텍스트가 너무 길어도 생략하지 않고 모두 표시
                              softWrap: true, // 텍스트가 화면을 넘어갈 경우 자동으로 줄바꿈
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            formatDate(comment.dateTime),
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      trailing: IconButton(
                        icon: const Icon(
                          Icons.cancel,
                          color: Colors.black26,
                        ),
                        onPressed: () {
                          setState(() {
                            comments = comments
                                .where((c) => c.id != comment.id)
                                .toList();
                          });
                        },
                      ),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Comment {
  String id;
  String content;
  DateTime dateTime;

  Comment({
    required this.id,
    required this.content,
    required this.dateTime,
  });
}

class TileBox extends StatelessWidget {
  final String title;
  final Color tileColor;

  const TileBox({
    super.key,
    required this.title,
    this.tileColor = Colors.red,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      leading: const Icon(Icons.done),
      title: Text(title),
      tileColor: tileColor,
    );
  }
}
