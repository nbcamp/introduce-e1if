import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:introduce_e1if/models/comment.dart';

class CommentTile extends StatelessWidget {
  const CommentTile({
    super.key,
    required this.comment,
    required this.onDelete,
  });

  final Comment comment;
  final void Function(String id) onDelete;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        comment.author,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        comment.content,
        style: const TextStyle(fontSize: 14, color: Colors.black87),
      ),
      trailing: IconButton(
        alignment: Alignment.centerRight,
        icon: const Icon(CupertinoIcons.xmark, size: 16),
        onPressed: () {
          onDelete(comment.id);
        },
      ),
    );
  }
}
