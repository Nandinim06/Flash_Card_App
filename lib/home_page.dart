import 'package:edu_flash/animation/fade_in_animation.dart';
import 'package:edu_flash/configs/constants.dart';
import 'package:edu_flash/data/words.dart';
import 'package:flutter/material.dart';

import 'Components/homepage_topictile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<String> _topics = [];


  @override
  initState() {
    for(var t in words){
      if(!_topics.contains(t.topic)){
      _topics.add(t.topic);
      }
      _topics.sort();
    }
    super.initState();
  }
  Widget build(BuildContext context) {

    final size= MediaQuery.of(context).size;
    final widthPadding = size.width * 0.03;
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        toolbarHeight: size.height * 0.10,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SizedBox(
                    width: size.width * kIconPadding,
                    child: Image.asset('assets/images/settings.png'),),
                SizedBox(height: size.height * kIconPadding,)
              ],
            ),
            const FadeInAnimation(child: Text('Hindi Flashcards\nहिंदी फ़्लैशकार्ड', textAlign: TextAlign.center,)),
            Column(
              children: [
                SizedBox(
                    width: size.width * kIconPadding,
                    child: Image.asset('assets/images/review.png'),),
                SizedBox(height: size.height * kIconPadding,)
              ],
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: widthPadding, right: widthPadding),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              expandedHeight: size.height * 0.40 ,
              flexibleSpace: FlexibleSpaceBar(
                background: Padding(
                  padding: EdgeInsets.all(size.width * 0.10),
                  child: FadeInAnimation (child: Image.asset('assets/images/Peacock.png')),
                ),
              ),
            ),
            SliverGrid(delegate: SliverChildBuilderDelegate(
              childCount: _topics.length,
                (context, index) => TopicTile(topic: _topics[index]),
            ), gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 6,
              mainAxisSpacing: 6,
            )
            )
          ],
        ),
      ),
    );
  }
}

