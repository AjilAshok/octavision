import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:octavision/homescreen/homescreen.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black,
      body: AnimatedSplashScreen(
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
        nextScreen: Home(),
        duration: 3000,
        splashTransition: SplashTransition.fadeTransition,
        // pageTransitionType: PageTransitionType.scale ,
        animationDuration: Duration(seconds: 2),
      ),
    ));
  }
}
