import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surf_flutter_courses_template/home_page/home_page.dart';
import 'package:surf_flutter_courses_template/theme/theme_provider.dart';
import 'package:flutter/scheduler.dart';

void main() {
  timeDilation = 2.0;
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    timeDilation = 3.0;
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          title: 'RadioTile App',
          theme: themeProvider.themeData,
          home: const HomePage(),
        );
      },
    );
  }
}
