import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../res/app_strings.dart';
import '../theme/theme_provider.dart';
import 'widgets/button_widget.dart';
import 'widgets/profile_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: themeProvider.themeData.scaffoldBackgroundColor,
          iconTheme: themeProvider.themeData.iconTheme,
          leading: const Icon(Icons.arrow_back),
          title: const Center(
            child: Text(
              AppStrings.profile,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          actions: [
            Text(
              AppStrings.saveButton,
              style: TextStyle(color: themeProvider.themeData.primaryColor),
            ),
            const SizedBox(
              width: 30,
            )
          ],
        ),
        body: const ProfileWidget(),
        bottomNavigationBar: const ButtonWidget());
  }
}
