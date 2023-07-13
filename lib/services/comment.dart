import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:introduce_e1if/models/comment.dart';

class UseState {
  final List<Comment> comments;
  final void Function(List<Comment> Function()) setState;

  UseState({
    required this.comments,
    required this.setState,
  });
}

class CommentService extends ChangeNotifier {
  final Map<String, List<Comment>> _comments = {};
  final Future<void> Function(String payload)? save;
  final Future<String?> Function()? load;

  CommentService({
    this.save,
    this.load,
  }) {
    try {
      _load().then((_) => notifyListeners());
    } catch (error) {
      // ignore
    }
  }

  UseState useState(String name) {
    return UseState(
      comments: List.unmodifiable(_comments[name] ?? []),
      setState: (newComments) {
        _comments[name] = newComments();
        notifyListeners();
        _save();
      },
    );
  }

  Future<void> _save() {
    if (save == null) return Future.value();

    String payload = jsonEncode(
      _comments.map(
        (key, values) => MapEntry(
          key,
          values.map((comment) => comment.toJson()).toList(),
        ),
      ),
    );
    return save!(payload);
  }

  Future<void> _load() async {
    if (load == null) return;

    String? payload = await load!();
    if (payload == null) return;

    jsonDecode(payload).forEach((key, values) {
      if (values is! List) return;
      _comments[key] = values.map((value) => Comment.fromJson(value)).toList();
    });
  }
}
