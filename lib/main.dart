import 'package:flutter/material.dart';
import 'main_screen.dart';

void main() => runApp(ColorApp());

class ColorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}
