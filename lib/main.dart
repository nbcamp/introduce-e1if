import 'package:flutter/material.dart';
import 'package:introduce_e1if/screens/jinyong.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: JinyongScreen(),
    );
  }
}
