

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:introduction_screen/introduction_screen.dart';
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
              title: "dfkldsjfldskjf",
              body: "etetdoihgiodhg",
              decoration: getpagedecor()
     
     
            ),
             PageViewModel(
              title: "ey58p93257345",
              body: "ejtioewht",
              decoration: getpagedecor()
     
     
            ),
            PageViewModel(
              title: "ey58p93257345",
              body: "ejtioewht",
              decoration: getpagedecor()
     
     
            )
          ],
          done: Icon(Icons.done,color: Colors.black,size: 35,),
          next:Icon(Icons.arrow_forward_ios,color: Colors.black,size: 27,),
         
          curve: Curves.fastLinearToSlowEaseIn,
          dotsDecorator: decorator(),
          animationDuration: 100,
          onDone: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home(),));
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