import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:introduce_e1if/models/comment.dart';
import 'package:intl/intl.dart';

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
      title: Row(
        children: [
          Text(
            comment.author,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          const VerticalDivider(width: 8),
          Text(
            DateFormat("yy/MM/dd HH:mm:ss").format(comment.createdAt),
            style: const TextStyle(fontSize: 10, color: Colors.grey),
          ),
        ],
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 4),
          Text(
            comment.content,
            style: const TextStyle(fontSize: 14, color: Colors.black87),
          ),
        ],
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
