import 'package:edu_flash/models/flashcards_page.dart';
import 'package:edu_flash/notifiers/flashcards_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

loadsession({required BuildContext context, required String topic}){

  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> FlashcardsPage()));
  Provider.of<FlashcardsNotifier>(context, listen: false).setTopic(topic: topic);
}