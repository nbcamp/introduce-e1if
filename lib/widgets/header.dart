import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header(this.content, {super.key});

  final String content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 10),
      child: Text(
        content,
        style: const TextStyle(
          fontSize: 20,
          height: 1.5,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
