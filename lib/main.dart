import "package:flutter/material.dart";
import "package:surf_flutter_courses_template/pages/colors_greed_page.dart";

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ColorGrid(),
      ),
    );
  }
}
