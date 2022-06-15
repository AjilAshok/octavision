import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octavision/barcode/barcodecamera.dart';
import 'package:octavision/barcode/barcoderesul.dart';
import 'package:octavision/currencydetection/currencycamer.dart';
import 'package:octavision/facedetction/facedectioncamera.dart';
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
  List images = [
    'https://static.vecteezy.com/system/resources/previews/005/680/276/large_2x/qr-code-scanning-app-icon-ui-ux-user-interface-2d-code-reading-app-matrix-barcode-scanner-two-dimensional-barcode-web-or-mobile-application-isolated-illustration-vector.jpg',
    'https://winaero.com/blog/wp-content/uploads/2019/11/Photos-new-icon.png',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR2VsJ_K6UUA2TOdu83uoDem5ulpvDiIXzbvA&usqp=CAU',
    'https://miro.medium.com/freeze/max/1000/1*PDA9zADqD9qqCu-CmJ9Ddw.gif',
    'https://miro.medium.com/freeze/max/1000/1*PDA9zADqD9qqCu-CmJ9Ddw.gif',
    'https://miro.medium.com/freeze/max/1000/1*PDA9zADqD9qqCu-CmJ9Ddw.gif',
    'https://miro.medium.com/freeze/max/1000/1*PDA9zADqD9qqCu-CmJ9Ddw.gif',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR2VsJ_K6UUA2TOdu83uoDem5ulpvDiIXzbvA&usqp=CAU',
  ];
  List textes = [
    "Object Detection",
    "Text Recognition",
    "Language Translation",
    "Currency Detection",
    "Language Identification",
    "Face Detection",
    "Barcode",
    "Image Label",
  ];
  List navigator = [
    // const Objectdectioncam(),
    ObjectDetectorView(),
     TextCam(),
     Translationmodel(),
     Currencydection(),
    LanguageIdentifierView(),
     Facedetction_camera(),
     Barcodeview(),
     Imagelabel_camera(),

    // const SpeechToText()
  ];
  List colorse = [
    const Color(0xFFD76C9C),
    const Color(0xff7C4AA7),
    const Color.fromARGB(255, 47, 23, 92),
    Colors.indigo,
    const Color.fromARGB(255, 28, 97, 103),
    Colors.purple,
    const Color.fromARGB(255, 221, 119, 17),
    const Color(0xFFA42838)
    // Colors.lightGreen
  ];
  List conter = [
    const Color(0xff7C4AA7),
    const Color.fromARGB(255, 47, 23, 92),
    Colors.indigo,
    const Color.fromARGB(255, 28, 97, 103),
    Colors.purple,
    const Color.fromARGB(255, 221, 119, 17),
    const Color(0xFFA42838),
    Colors.white,
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: NestedScrollView(
              physics: NeverScrollableScrollPhysics(),
              floatHeaderSlivers: false,
              headerSliverBuilder: ((context, innerBoxIsScrolled) => [
                    SliverAppBar(
                      //  floating: true,

                      toolbarHeight: 130,
                      backgroundColor: Colors.white,
                      flexibleSpace: ClipPath(
                          // clipper: Customsphape(),
                          child: Container(
                        height: 200,
                        color: Colors.white,
                        child: Center(
                          child: Text(
                            "Soul",
                            style: GoogleFonts.montserrat(
                                fontSize: 30,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 10),
                          ),
                        ),
                      )),
                    )
                  ]),
              body: NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (OverscrollIndicatorNotification notification) {
                  notification.disallowIndicator();
                  return true;
                },
                child: SingleChildScrollView(
                  //  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      WaveWidget(
                          waveFrequency: 2,
                          config: CustomConfig(gradients: [
                            [
                              Color.fromARGB(255, 28, 115, 31),
                              Color.fromARGB(255, 3, 68, 36)
                            ],
                            [
                              Color(0xFFD76C9C),
                              Color.fromARGB(255, 47, 23, 92)
                            ],
                            [Colors.indigo, Color(0xff7C4AA7)],
                            [Colors.redAccent, Colors.pinkAccent],
                            [
                              Color(0xFFD76C9C),
                              Color.fromARGB(255, 201, 35, 91)
                            ],
                          ], durations: [
                            3500,
                            19440,
                            10800,
                            6000,
                            7500
                          ], heightPercentages: [
                            0.20,
                            0.23,
                            0.25,
                            0.30,
                            0.33
                          ]),
                          size: Size(double.infinity, 100)),
                      Flexible(
                        flex: 0,
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: textes.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => navigator[index],
                                    ));
                              },
                              child: Stack(
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: MediaQuery.of(context).size.height *
                                        0.2,
                                    decoration: BoxDecoration(
                                        color: conter[index],
                                        border: Border.all(
                                            width: 0, color: colorse[index])),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(bottom: 0),
                                    margin: const EdgeInsets.only(bottom: 0),
                                    height: MediaQuery.of(context).size.height *
                                        0.2,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 0, color: colorse[index]),
                                        color: colorse[index],
                                        borderRadius: const BorderRadius.only(
                                            bottomLeft: Radius.circular(100))),
                                    child: Padding(
                                        padding: const EdgeInsets.all(30),
                                        child: HomeIcons(
                                          index: index,
                                          names: textes,
                                          logimage: images,
                                        )),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ))),
    );
  }
}
