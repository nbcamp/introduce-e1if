import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:introduce_e1if/models/comment.dart';
import 'package:introduce_e1if/widgets/comment_tile.dart';

class Comments extends StatelessWidget {
  Comments({
    super.key,
    required this.comments,
    required this.onSubmit,
    required this.onDelete,
  });

  final List<Comment> comments;
  final void Function(String query) onSubmit;
  final void Function(String id) onDelete;

  final TextEditingController textarea = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: textarea,
          onSubmitted: (query) {
            onSubmit(query);
            textarea.clear();
          },
          cursorColor: Colors.grey,
          textAlignVertical: TextAlignVertical.center,
          style: const TextStyle(fontSize: 14, color: Colors.black87),
          decoration: const InputDecoration(
            prefixIcon: Icon(CupertinoIcons.chat_bubble_2,
                color: Colors.grey, size: 20),
            hintText: '댓글을 남겨주세요.',
            hintStyle: TextStyle(fontSize: 14, color: Colors.black54),
          ),
        ),
        const SizedBox(height: 10),
        if (comments.isEmpty)
          Container(
            height: 100,
            alignment: Alignment.center,
            child: const Text(
              '첫 댓글을 남겨주세요!',
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
          )
        else
          ...comments.map((comment) {
            return CommentTile(
              comment: comment,
              onDelete: onDelete,
            );
          }).toList(),
      ],
    );
  }
}
