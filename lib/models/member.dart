import 'package:flutter/material.dart';

class Member {
  final String name;
  final String mbti;
  final String tmi;
  final String role;
  final String blog;
  final String github;
  final String profile;
  final Widget? widget;

  Member({
    required this.name,
    required this.mbti,
    required this.tmi,
    required this.role,
    required this.blog,
    required this.github,
    required this.profile,
    this.widget,
  });
}
