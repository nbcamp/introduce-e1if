// ignore_for_file: prefer_const_constructors, must_be_immutable
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:introduce_e1if/models/comment.dart';
import 'package:provider/provider.dart';
import 'package:introduce_e1if/services/comment.dart';

class SanghunScreen extends StatefulWidget {
  const SanghunScreen({Key? key}) : super(key: key);

  @override
  State<SanghunScreen> createState() => _SanghunScreenState();
}

class _SanghunScreenState extends State<SanghunScreen> {
  TextEditingController commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<CommentService>(builder: (context, commentService, child) {
      var UseState(:comments, :setState) = commentService.useState('김상훈');

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
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 40.0,
                      child: TextField(
                        controller: commentController,
                        style: TextStyle(
                            fontSize: 13.0, height: 1.2, color: Colors.black),
                        onSubmitted: (query) {
                          if (query.isEmpty) {
                            return;
                          }
                          setState(() {
                            return [
                              Comment(
                                id: DateTime.now().toString(),
                                author: 'Anonymous',
                                content: query,
                              ),
                              ...comments,
                            ];
                          });
                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 15),
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
                  const SizedBox(width: 2),
                  ElevatedButton(
                    onPressed: () {
                      String comment = commentController.text.trim();
                      if (comment.isNotEmpty) {
                        setState(() {
                          return [
                            Comment(
                              id: DateTime.now().toString(),
                              author: 'Anonymous',
                              content: comment,
                            ),
                            ...comments,
                          ];
                        });
                        commentController.clear();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black38,
                      shape: CircleBorder(),
                    ),
                    child: Icon(
                      Icons.keyboard_return_rounded,
                      size: 18,
                    ),
                  )
                ],
              ),
              SizedBox(height: 10),
              if (comments.isEmpty)
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text('아직 댓글이 없습니다 😢', textAlign: TextAlign.center),
                ),
              ...comments.map((comment) => ListTile(
                    title: Row(
                      children: [
                        Expanded(
                          child: Text(
                            comment.content,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                            overflow: TextOverflow.visible,
                            softWrap: true,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          DateFormat('yyyy/MM/dd HH:mm')
                              .format(comment.createdAt),
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 10,
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
                          return comments
                              .where((c) => c.id != comment.id)
                              .toList();
                        });
                      },
                    ),
                  ))
            ],
          ),
        ),
      );
    });
  }
}

class TileBox extends StatelessWidget {
  final String title;
  final Color tileColor;

  const TileBox({
    Key? key,
    required this.title,
    this.tileColor = Colors.red,
  }) : super(key: key);

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
