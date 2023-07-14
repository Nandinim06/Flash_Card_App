import 'package:edu_flash/Components/card1_flashpage.dart';
import 'package:edu_flash/Components/card_2.dart';
import 'package:edu_flash/animation/half_flip_animation.dart';
import 'package:edu_flash/animation/slide_animation.dart';
import 'package:edu_flash/notifiers/flashcards_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Components/custom_appBar.dart';

class FlashcardsPage extends StatefulWidget {
  const FlashcardsPage({super.key});

  @override
  State<FlashcardsPage> createState() => _FlashcardsPageState();
}

class _FlashcardsPageState extends State<FlashcardsPage> {

  @override
  initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final flashcardsNotifier = Provider.of<FlashcardsNotifier>(context, listen: false);
      flashcardsNotifier.runSlideCard1();
      flashcardsNotifier.generateAllSelectedWords();
      flashcardsNotifier.generateCurrentWord();
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Consumer<FlashcardsNotifier>(
      builder: (_, notifier, __) =>
          Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(56),
                child: CustomAppBar()),
            body: IgnorePointer(
              ignoring: notifier.ignoreTouches,
              child: Stack(
                children: [
                  Card1(),
                  Card2(),
                ],
              ),
            ),
              ),
            );

  }
}

