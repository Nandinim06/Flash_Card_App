
import 'package:edu_flash/Components/Card_Display.dart';
import 'package:edu_flash/animation/half_flip_animation.dart';
import 'package:edu_flash/animation/slide_animation.dart';
import 'package:edu_flash/configs/constants.dart';
import 'package:edu_flash/enums/Slide_Direction.dart';
import 'package:edu_flash/notifiers/flashcards_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Card1 extends StatelessWidget {
  const Card1({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer<FlashcardsNotifier>(
      builder: (_, notifier, __) => GestureDetector(
        onDoubleTap: (){
          notifier.runFlipCard1();
          notifier.setIgnoreTouch(ignore: true);
        },
        child: HalfFlipAnimation(
          animate: notifier.flipCard1,
          reset: notifier.resetSlideCard1,
          flipFromHalfWay: false,
          animationCompleted: (){
            notifier.resetCard1();
            notifier.runFlipCard2();
          },
          child: SlideAnimation(
            animationCompleted: (){
              notifier.setIgnoreTouch(ignore: false);
            },
            reset: notifier.resetSlideCard1,
            animate: notifier.slideCard1,
            direction: SlideDirection.upIn,
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
                child: CardDisplay(isCard1: true),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
