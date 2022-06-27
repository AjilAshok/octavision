

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:octavision/bottomnavbar/bottomnav.dart';
import 'package:octavision/homescreen/homescreen.dart';
class OnborderingScreen extends StatelessWidget {
  const OnborderingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return    SafeArea(child:
     Scaffold(
       body: IntroductionScreen(
         globalBackgroundColor: Colors.white,
         baseBtnStyle:ButtonStyle(backgroundColor:MaterialStateProperty.all(Colors.white,),) ,
          pages: [
            PageViewModel(
              title: "A Soul for Visually Impared ",
              body: "World's First Initiative for blind people",
              decoration: getpagedecor()
     
     
            ),
             PageViewModel(
              title: "Control Through Voice ",
              body: "Automate Your life through artificial intelligence",
              decoration: getpagedecor()
     
     
            ),
            PageViewModel(
              title: "You are about to enter into an era of Ai",
              body: "Go ON!",
              decoration: getpagedecor()
     
     
            )
          ],
          done: Icon(Icons.done,color: Colors.black,size: 35,),
          next:Icon(Icons.arrow_forward_ios,color: Colors.black,size: 27,),
         
          curve: Curves.fastLinearToSlowEaseIn,
          dotsDecorator: decorator(),
          animationDuration: 100,
          onDone: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BottomNav(),));
          },
        
     
        
         ),
     ));
    
  }
  PageDecoration getpagedecor()=>PageDecoration(
    titleTextStyle: TextStyle(
      fontSize: 20
    ),
    bodyTextStyle: TextStyle(
      fontSize: 20
    ),
    pageColor: Colors.white
  );
  DotsDecorator decorator()=>DotsDecorator(
    color: Colors.blue,
    activeColor:Colors.black ,
    activeSize: Size(22,10),
    activeShape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24)
    )

  );
}