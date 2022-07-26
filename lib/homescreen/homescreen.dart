import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octavision/barcode/barcodecamera.dart';
import 'package:octavision/barcode/barcoderesul.dart';
import 'package:octavision/currencydetection/currencycamer.dart';
import 'package:octavision/facedetction/facedectioncamera.dart';
import 'package:octavision/homescreen/settingspage.dart';
import 'package:octavision/homescreen/widgets/appbarscreen.dart';
import 'package:octavision/homescreen/widgets/howescreenimagesicon.dart';
import 'package:octavision/imagelabeling/imagelabelecamera.dart';
import 'package:octavision/languageidentificattion/languageidentification.dart';
import 'package:octavision/languagetranslation/translation.dart';
import 'package:octavision/objectdetection/objectdetectioncam.dart';
import 'package:octavision/speechtotext/speechtotext.dart';
import 'package:octavision/textrecognise/textrecoginisecam.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
 
  List textes = [
    "Find",
    "Read",
    "Currency ",
    "People",
    "Barcode",
    "See",
    // "Translation",
    "Language ",
  ];

  List img = [
    "assets/magnifying-glass (1).png",
    "assets/text.png",
    "assets/cash.png",
    "assets/face-scan.png",
    "assets/barcode-scanner.png",
    "assets/content-creator (1).png",
    "assets/translation.png",
    "assets/letter.png",
  ];

  List navigators = [
    // const Objectdectioncam(),
    ObjectDetectorView(
      outputvoice: "all",
    ),
    TextCam(),

    Currencydection(),

    Facedetction_camera(),
    Barcodeview(),
    //  SpeechToText()
    Imagelabel_camera(),
    // Translationmodel(text: "dfsf",),
    LanguageIdentifierView(),

    // const SpeechToText()
  ];
  static const colorse = [
    Colors.black,
    Color.fromARGB(255, 15, 12, 237),
    // Colors.yellow,
    // Colors.red,
  ];
  

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      // extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      body: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (OverscrollIndicatorNotification notification) {
            notification.disallowIndicator();
            return true;
          },
          child: Container(
             decoration: BoxDecoration(
                  color: Colors.grey.shade500,
                  image: const DecorationImage(
                      image: AssetImage("assets/background.jpeg"),
                      fit: BoxFit.cover)),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 200,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                      backgroundColor: Colors.black45,
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20.0))),
                                      contentPadding: const EdgeInsets.only(
                                          left: 25, right: 25),
                                      content: SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            Text(
                                                "Read -- Read will instantly read out any short text you're pointing the camera and capture the image text.",
                                                style: styke()),
                                            Sized_box(),
                                            Text(
                                              "See -- Tap the button to capture a photo you want to be described. Soul will speak out the most probable description for it.",
                                              style: styke(),
                                            ),
                                            Sized_box(),
                                            Text(
                                              "Barcode -- Barcode help scan any barcode for payment or websites.Tap the button and point the camera at the product you want to recognise  barcode will detected live. Find Tap the button and scan your surroundings in real time. Soul will speak out the name of identified objects that appears in the frame.",
                                              style: styke(),
                                            ),
                                            Sized_box(),
                                            Text(
                                              "People -- Tap the button and capture the option to recognise total no.of people present the surroundings.",
                                              style: styke(),
                                            ),
                                            Sized_box(),
                                            Text(
                                              "Language -- Laguage option helps to recognize the language who it is written.",
                                              style: styke(),
                                            ),
                                            Sized_box(),
                                            Text(
                                              "Translation -- Tap translation button to translate any languages",
                                              style: styke(),
                                            ),
                                            // Sized_box(),
                                          ],
                                        ),
                                      ),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text(
                                              "OK",
                                              style:
                                                  TextStyle(color: Colors.white),
                                            ))
                                      ],
                                    ));
                          },
                          child: Container(
                            height: 55,
                            width: 55,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.transparent,
                                image: const DecorationImage(
                                    image: AssetImage("assets/question.png"),
                                    fit: BoxFit.fitHeight)),
                          ),
                        ),
                        Center(
                          child: AnimatedTextKit(
                              repeatForever: true,
                              animatedTexts: [
                                ScaleAnimatedText(
                                  "SOUL",
                                  textStyle: TextStyle(
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 2,
                                      color: Colors.white),
                                ),
                                ScaleAnimatedText(
                                  "SOUL",
                                  textStyle: TextStyle(
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 2,
                                      color: Colors.white),
                                )
                              ]),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(Settings());
                          },
                          child: Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.transparent,
                                image: const DecorationImage(
                                    image: AssetImage("assets/setting.png"),
                                    fit: BoxFit.fitHeight)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 2,
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => navigators[index],
                                ));
                          },
                          child: Container(
                            height: 150,
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                               gradient: const LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.bottomLeft,
                                      colors: [Colors.black87, Colors.black]),
                              // gradient: LinearGradient(
                              //     begin: Alignment.topLeft,
                              //     end: Alignment.bottomRight,
                              //     colors: [ contera[index],conter[index],conter[index]]),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(25)),
                              color: Colors.black.withOpacity(.6)
                            ),
                            // margin:const EdgeInsets.only(top: 10),

                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Image.asset(
                                  img[index],
                                  fit: BoxFit.fill,
                                  height: 50,
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 20, left: 5),
                                  child: Text(textes[index],
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: GoogleFonts.acme(
                                          color: Colors.white,
                                          fontSize: 25,
                                          fontWeight: FontWeight.w300,
                                          letterSpacing: 1)),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      itemCount: textes.length,
                    ),
                  )
                ],
              ),
            ),
          )),
    ));
  }

  styke() {
    return const TextStyle(
        fontSize: 20, fontWeight: FontWeight.w400, color: Colors.white);
  }

  Widget Sized_box() {
    return const SizedBox(
      height: 10,
    );
  }
}
