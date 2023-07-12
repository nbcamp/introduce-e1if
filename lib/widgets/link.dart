import 'package:flutter/material.dart';
import 'package:introduce_e1if/screens/webview.dart';

class Link extends StatelessWidget {
  const Link(
    this.url, {
    super.key,
    this.alt,
    this.style,
  });

  final String url;
  final String? alt;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WebViewScreen(url: url),
          ),
        );
      },
      child: Text(alt ?? url,
          style: const TextStyle(color: Colors.blue).merge(style)),
    );
  }
}
