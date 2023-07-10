import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:introduce_e1if/models/comment.dart';

class CommentTile extends StatefulWidget {
  const CommentTile({
    super.key,
    required this.comment,
    required this.onDelete,
  });

  final Comment comment;
  final void Function(String id) onDelete;

  @override
  State<CommentTile> createState() => _CommentTileState();
}

class _CommentTileState extends State<CommentTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        widget.comment.author,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        widget.comment.content,
        style: const TextStyle(fontSize: 14, color: Colors.black87),
      ),
      trailing: IconButton(
        icon: const Icon(CupertinoIcons.xmark),
        onPressed: () {
          widget.onDelete(widget.comment.id);
        },
      ),
    );
  }
}
