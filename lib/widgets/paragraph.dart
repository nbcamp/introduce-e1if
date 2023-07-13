import 'package:flutter/material.dart';

class Paragraph extends StatelessWidget {
  const Paragraph(
    this.content, {
    super.key,
    this.separator = '\n',
    this.style,
  });

  final List<String> content;
  final String separator;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        content.join(separator),
        style: const TextStyle(
          height: 1.5,
          fontSize: 16,
        ).merge(style),
      ),
    );
  }
}
