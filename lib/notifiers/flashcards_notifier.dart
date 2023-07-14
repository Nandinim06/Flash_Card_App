import 'dart:math';

import 'package:edu_flash/configs/constants.dart';
import 'package:edu_flash/data/words.dart';
import 'package:edu_flash/enums/Slide_Direction.dart';
import 'package:edu_flash/models/word.dart';
import 'package:flutter/material.dart';

class FlashcardsNotifier extends ChangeNotifier {

  String topic = "";
  Word word1 = Word(topic: "", english: "Loading Arrow", character: "", uchchaaran: "");
  Word word2 = Word(topic: "", english: "Loading Arrow", character: "", uchchaaran: "");
  List<Word> selectedWords = [];

  setTopic({required String topic}){
    this.topic = topic;
    notifyListeners();

  }

  generateAllSelectedWords(){
    selectedWords.clear();
    selectedWords = words.where((element) => element.topic == topic).toList();
  }

  generateCurrentWord() {
    if (selectedWords.isNotEmpty){
      final r = Random().nextInt(selectedWords.length);
    word1 = selectedWords[r];
    selectedWords.removeAt(r);
  }else{
      print('all words selected');
    }

    Future.delayed(const Duration(milliseconds: kSlideAwayDuration),(){
      word2 = word1;
    } );

  }


  ///Animation code
  bool ignoreTouches = true;

  setIgnoreTouch({required bool ignore}){
    ignoreTouches = ignore;
    notifyListeners();
  }

  SlideDirection swipedDirection = SlideDirection.none;

  bool slideCard1 = false, flipCard1 = false, flipcard2 = false, swipeCard2 = false;

  bool resetSlideCard1 = false, resetFlipCard1 = false, resetFlipCard2 = false, resetSwipeCard2 = false;

  runSlideCard1(){
    resetSlideCard1 = false;
    slideCard1 = true;
    notifyListeners();
  }

  runFlipCard1(){
    resetFlipCard1 = false;
    flipCard1 = true;
    notifyListeners();
  }

  resetCard1(){
    resetSlideCard1 = true;
    resetFlipCard1 = true;
    slideCard1 = false;
    flipCard1 = false;
  }

  runFlipCard2(){
    resetFlipCard2 = false;
    flipcard2 = true;
    notifyListeners();

  }
  runSwipeCard2({required SlideDirection direction}){
    swipedDirection = direction;
    resetSwipeCard2 = false;
    swipeCard2 = true;
    notifyListeners();

  }

  resetCard2(){
    resetFlipCard2 = true;
    resetSwipeCard2 = true;
    flipcard2 = false;
    swipeCard2 = false;
  }


}

