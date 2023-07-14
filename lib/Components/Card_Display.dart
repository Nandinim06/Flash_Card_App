
import 'package:edu_flash/notifiers/flashcards_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardDisplay extends StatelessWidget {
  const CardDisplay({required this.isCard1,
    super.key,
  });

  final bool isCard1;

  @override
  Widget build(BuildContext context) {
    return Consumer<FlashcardsNotifier>(
      builder: (_, notifier, __) =>
      isCard1 ? Column(
        children: [
          buildImage(notifier.word1.english),
          buildTextBox(notifier.word1.english, context,1 ),
        ],
      ) : Column(
        children: [
          buildImage(notifier.word2.english),
          buildTextBox(notifier.word2.character, context,2),
          buildTextBox(notifier.word2.uchchaaran, context,1),

        ],
      ),
    );
  }

  Expanded buildImage(String image) {
    return Expanded(
        flex: 4,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Image.asset('assets/images/${image}.png'),
        ));
  }
}
  Expanded buildTextBox(String text, BuildContext context, int flex){
    return Expanded(
        flex: flex,
        child: SizedBox(
    width: 150,
    height: 150,
        child: FittedBox(
        child: Text(text,
        style: Theme.of(context).textTheme.headline1,
    ),
    )
    ));


  }




