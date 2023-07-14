import 'package:edu_flash/configs/themes.dart';
import 'package:edu_flash/home_page.dart';
import 'package:edu_flash/notifiers/flashcards_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> FlashcardsNotifier())
      ],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hindi Flashcards',
      theme: appTheme,
      home: const HomePage(),
    );
  }
}
