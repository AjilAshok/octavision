// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';

import 'package:octavision/homescreen/homescreen.dart';
// import 'package:octavision/languagetranslation/translation.dart';
import 'package:octavision/secondehome/secondehomescreen.dart';
import 'package:octavision/speechtotext/speechtotext.dart';
// import 'package:octavision/textrecognise/textrecoginisecam.dart';

class BottomNav extends StatelessWidget {
   BottomNav({Key? key}) : super(key: key);
 
  int indexe=0;
  PageController pageController = PageController(initialPage: 1);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: PageView(
        controller: pageController,
        scrollDirection: Axis.horizontal,
        children: [
          SpeechToText(),
         Home(),
         SecondhomeScreen()
        ],
      )
     
    ));
  }
}
