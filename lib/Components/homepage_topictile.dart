import 'package:edu_flash/animation/fade_in_animation.dart';
import 'package:edu_flash/configs/constants.dart';
import 'package:edu_flash/utils/methods.dart';
import 'package:flutter/material.dart';

class TopicTile extends StatelessWidget {
  const TopicTile({
    Key? key,
    required this.topic,
  }) : super(key: key);

  final String topic;

  @override
  Widget build(BuildContext context) {
    return FadeInAnimation(
      child: GestureDetector(
        onTap: (){
          print('tile tapped $topic');
          loadsession(context: context, topic: topic);
        },
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(kCircularBorder),
          ),
          child: Column(
            children: [
              Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Hero(
                        tag: topic,
                        child: Image.asset('assets/images/$topic.png')),
                  )),
              Expanded(child: Text(topic)),
            ],
          ),
        ),
      ),
    );
  }
}