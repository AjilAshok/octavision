// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:octavision/currencydetection/currencycamer.dart';
import 'package:octavision/facedetction/facedectioncamera.dart';
import 'package:octavision/homescreen/homescreen.dart';
import 'package:octavision/languagetranslation/translation.dart';
import 'package:octavision/secondehome/secondehomescreen.dart';
import 'package:octavision/textrecognise/textrecoginisecam.dart';

class BottomNav extends StatelessWidget {
   BottomNav({Key? key}) : super(key: key);
 
  int indexe=0;
  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: PageView(
        scrollDirection: Axis.horizontal,
        children: [
         Home(),
      //  const  SecondhomeScreen()
        ],
      )
      // bottomNavigationBar:BottomNavigationBar(
      //   selectedItemColor:Colors.purple ,
      //   selectedFontSize: 15,
      //   showUnselectedLabels: false,
      //   // selectedIconTheme:IconTheme(data: , child: child) ,

      //   elevation: 0,
      //   currentIndex: currentIndex,
      //   onTap: (index){
      //    pageController.animateToPage(index, duration:const Duration(microseconds:100 ), curve: Curves.ease);
      //   },
      //   type: BottomNavigationBarType.shifting,

      //   items:const [
      //   BottomNavigationBarItem(

      //     backgroundColor: Colors.transparent,
      //     icon:Icon(Icons.home,color: Colors.purple),
      //   label: "Home",
      //   ),
      //     BottomNavigationBarItem(

      //        backgroundColor: Colors.transparent,
      //       icon:Icon(Icons.camera_alt,color: Colors.purple,),
      //   label: "Camera",

      //   )
      // ]) ,
    ));
  }
}
