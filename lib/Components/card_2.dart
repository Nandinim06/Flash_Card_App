import 'dart:math';

import 'package:edu_flash/Components/Card_Display.dart';
import 'package:edu_flash/animation/half_flip_animation.dart';
import 'package:edu_flash/animation/slide_animation.dart';
import 'package:edu_flash/configs/constants.dart';
import 'package:edu_flash/enums/Slide_Direction.dart';
import 'package:edu_flash/notifiers/flashcards_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Card2 extends StatelessWidget {
  const Card2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer<FlashcardsNotifier>(
      builder: (_, notifier, __) => GestureDetector(
        onHorizontalDragEnd: (details) {
          if (details.primaryVelocity! > 100) {
            notifier.runSwipeCard2(direction: SlideDirection.leftAway);
            notifier.runSlideCard1();
            notifier.setIgnoreTouch(ignore: true);
            notifier.generateCurrentWord();
          }
          if (details.primaryVelocity! < -100) {
            notifier.runSwipeCard2(direction: SlideDirection.rightAway);
            notifier.runSlideCard1();
            notifier.setIgnoreTouch(ignore: true);
            notifier.generateCurrentWord();
          }
        },
        child: HalfFlipAnimation(
          animate: notifier.flipcard2,
          reset: notifier.resetFlipCard2,
          flipFromHalfWay: true,
          animationCompleted: () {
            notifier.setIgnoreTouch(ignore: false);
          },
          child: SlideAnimation(
            animationCompleted: () {
              notifier.resetCard2();
            },
            reset: notifier.resetSwipeCard2,
            animate: notifier.swipeCard2,
            direction: notifier.swipedDirection,
            child: Center(
              child: Container(
                width: size.width * 0.90,
                height: size.height * 0.70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(kCircularBorder),
                  border: Border.all(
                    color: Colors.white,
                    width: kCardBorderWidth,
                  ),
                  color: Theme.of(context).primaryColor,
                ),
                child: Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.rotationY(pi),
                    child: const CardDisplay(isCard1: false),
              ),
            ),
          ),
        ),
      ),
      ),
    );
  }
}
