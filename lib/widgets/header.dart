import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header(this.content, {super.key, this.style});

  final String content;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, bottom: 30),
      child: Text(
        content,
        style: const TextStyle(
          fontSize: 20,
          height: 1.5,
          fontWeight: FontWeight.bold,
        ).merge(style),
      ),
    );
  }
}
