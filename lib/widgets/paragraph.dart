import 'package:flutter/material.dart';

class Paragraph extends StatelessWidget {
  const Paragraph(this.content, {super.key, this.separator = '\n'});

  final List<String> content;
  final String separator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        content.join(separator),
        style: const TextStyle(
          height: 1.5,
          fontSize: 14,
        ),
      ),
    );
  }
}
