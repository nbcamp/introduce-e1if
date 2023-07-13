import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:introduce_e1if/models/comment.dart';
import 'package:introduce_e1if/services/data_handler.dart';

class UseState {
  final List<Comment> comments;
  final void Function(List<Comment> Function()) setState;

  UseState({
    required this.comments,
    required this.setState,
  });
}

class CommentService extends ChangeNotifier with DataHandler {
  final Map<String, List<Comment>> _comments = {};

  CommentService(IO io) {
    this.io = io;

    try {
      load().then((_) => notifyListeners());
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
        save();
      },
    );
  }

  @override
  FutureOr<void> import(String payload) {
    jsonDecode(payload).forEach((key, values) {
      if (values is! List) return;
      _comments[key] = values.map((value) => Comment.fromJson(value)).toList();
    });
  }

  @override
  FutureOr<String> export() {
    return jsonEncode(
      _comments.map(
        (key, values) => MapEntry(
          key,
          values.map((comment) => comment.toJson()).toList(),
        ),
      ),
    );
  }
}
