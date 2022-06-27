import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:octavision/bottomnavbar/bottomnav.dart';
import 'package:octavision/homescreen/homescreen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octavision/indroductionscreen/indroductionscreen.dart';
import 'package:octavision/main.dart';


class Splashscreen extends StatelessWidget {
   Splashscreen({Key? key}) : super(key: key);

  
   final FlutterTts voicetest=FlutterTts();
   String welcomevoice="Welcome,, to Octtaaaa  vission.";
  //  bool visible=false;
  
  @override
  Widget build(BuildContext context) {
  
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height*0.8,
            child: AnimatedSplashScreen(
              backgroundColor: Colors.black,
              splash: Container(
                
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    image: DecorationImage(
                        image: AssetImage(
                            "assets/WhatsApp Image 2022-05-13 at 3.22.03 PM.jpeg"),
                        fit: BoxFit.cover)),
              ),
              nextScreen:initScreen==0||initScreen==null?OnborderingScreen():BottomNav(),
            
              duration: 3000,
              splashTransition: SplashTransition.fadeTransition,
              
              animationDuration: Duration(seconds: 2),
              
            ),
          ),
          
          Expanded(
              child: Text("REDESINGING THE WORLD",style: GoogleFonts.montserrat(color: Colors.white),),
            )
        ],
      ),
    ));
  }
  speack()async{
   print(await voicetest.getVoices);
     await voicetest.setLanguage("en-US");
    // await voicetest.setVoice({"name": "en-gb-x-gba-local", "locale": "en-GB"});
    await voicetest.setPitch(1);
    await voicetest.setSpeechRate(0.3);
    await voicetest.speak(welcomevoice);
  }
}
