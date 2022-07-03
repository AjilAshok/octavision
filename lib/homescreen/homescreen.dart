import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
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
  // List images = [
  //   'https://static.vecteezy.com/system/resources/previews/005/680/276/large_2x/qr-code-scanning-app-icon-ui-ux-user-interface-2d-code-reading-app-matrix-barcode-scanner-two-dimensional-barcode-web-or-mobile-application-isolated-illustration-vector.jpg',
  //   'https://winaero.com/blog/wp-content/uploads/2019/11/Photos-new-icon.png',
  //   'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR2VsJ_K6UUA2TOdu83uoDem5ulpvDiIXzbvA&usqp=CAU',
  //   'https://miro.medium.com/freeze/max/1000/1*PDA9zADqD9qqCu-CmJ9Ddw.gif',
  //   'https://miro.medium.com/freeze/max/1000/1*PDA9zADqD9qqCu-CmJ9Ddw.gif',
  //   'https://miro.medium.com/freeze/max/1000/1*PDA9zADqD9qqCu-CmJ9Ddw.gif',
  //   'https://miro.medium.com/freeze/max/1000/1*PDA9zADqD9qqCu-CmJ9Ddw.gif',
  //   'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR2VsJ_K6UUA2TOdu83uoDem5ulpvDiIXzbvA&usqp=CAU',
  // ];
  List textes = [
    "Find",
    "Read",
    "Translation",
    "Currency ",
    "Language ",
    "People",
    "Barcode",
    "See",
  ];

  List img = [
    "assets/magnifying-glass (1).png",
    "assets/text.png",
    "assets/translation.png",
    "assets/cash.png",
    "assets/letter.png",
    "assets/face-scan.png",
    "assets/barcode-scanner.png",
    "assets/content-creator (1).png"
  ];
  String? alertext = """Read
Read will instantly read out any short text you're pointing the camera and capture the image text.

See
Tap the button to capture a photo you want to be described. Soul will speak out the most probable description for it.

Barcode
Barcode help scan any barcode for payment or websites.Tap the button and point the camera at the product you want to recognise  barcode will detected live. Find Tap the button and scan your surroundings in real time. 
Soul will speak out the name of identified objects that appears in the frame.

People 
Tap the button and capture the option to recognise total no.of people present the surroundings.

Language 
Laguation option helps to recognize the language who it is written.

Translation
Tap translation button to translate any languages
  """;
  List navigators = [
    // const Objectdectioncam(),
    ObjectDetectorView(
      outputvoice: "all",
    ),
    TextCam(),
    Translationmodel(),
    Currencydection(),
    LanguageIdentifierView(),
    Facedetction_camera(),
    Barcodeview(),
    //  SpeechToText()
    Imagelabel_camera(),

    // const SpeechToText()
  ];
  List colorse = [
    const Color.fromARGB(255, 25, 136, 227),
    Color.fromARGB(255, 11, 222, 148),
    Color.fromARGB(255, 240, 134, 237),
    Colors.indigo,
    const Color.fromARGB(255, 28, 97, 103),
    Color.fromARGB(255, 113, 88, 227),
    Colors.purple,
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
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      //         appBar: AppBar(
      //           shape: const RoundedRectangleBorder(

      //   borderRadius: BorderRadius.vertical(
      //     bottom: Radius.circular(25),
      //   ),
      // ),
      //           // toolbarHeight: 150,
      //           backgroundColor: Colors.transparent,
      //           leading: IconButton(onPressed: (){}, icon:const Icon(Icons.question_mark_rounded,size:45 ,)),
      //           actions:  [
      //             Padding(padding:const EdgeInsets.all(10),
      //             child:IconButton(onPressed: (){}, icon: const Icon(Icons.settings,size:45)) ,
      //             )

      //           ],

      body: NestedScrollView(
          physics: const NeverScrollableScrollPhysics(),
          floatHeaderSlivers: false,
          headerSliverBuilder: ((context, innerBoxIsScrolled) => [
                SliverAppBar(
                  elevation: 0,
                  floating: true,
                  toolbarHeight: 250,
                  backgroundColor: Colors.black,
                  flexibleSpace: ClipPath(
                      // clipper:Customsphape() ,
                      // child: Padding(
                      //   padding:
                      //       const EdgeInsets.only(top: 15, left: 10, right: 10),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //     children: [

                      //       Container(
                      //         height: 55,
                      //         width: 55,
                      //         decoration: BoxDecoration(
                      //             borderRadius: BorderRadius.circular(30),
                      //             color: Colors.black,
                      //             image: const DecorationImage(
                      //                 image: AssetImage("assets/question.png"),
                      //                 fit: BoxFit.fitHeight)),
                      //       ),
                      //       Container(
                      //         height: 60,
                      //         width: 60,
                      //         decoration: BoxDecoration(
                      //             borderRadius: BorderRadius.circular(30),
                      //             color: Colors.black,
                      //             image: const DecorationImage(
                      //                 image: AssetImage("assets/setting.png"),
                      //                 fit: BoxFit.fitHeight)),
                      //       ),

                      //     ],
                      //   ),
                      // ),
                      clipper: Customsphape(),
                      child: Container(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/blackshade.jpeg"),
                              fit: BoxFit.cover),
                           color: Colors.grey,
                        ),
                        height: 350,
                        // color: Colors.black,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: (){
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
                                        )),
                                        actions: [
                                          TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Text(
                                                "OK",
                                                style: TextStyle(
                                                    color: Colors.white),
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
                                        image:
                                            AssetImage("assets/question.png"),
                                        fit: BoxFit.fitHeight)),
                              ),
                            ),
                            SizedBox(
                              height: 200,
                              // color: Colors.black12,
                              child: Center(
                                child: Text(
                                  "Soul",
                                  style: GoogleFonts.montserrat(
                                      fontSize: 30,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 10),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: (){
                         Navigator.push(context, MaterialPageRoute(builder: (context) => Theme(
                          data: ThemeData.dark().copyWith(
                              appBarTheme:const AppBarTheme(
                            color: Colors.black,
                            elevation: 0,
                          )),
                          child:const LicensePage(applicationName: "Soul",)),));
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
                      )),
                )
              ]),
          body: Container(
            // padding: EdgeInsets.all(0),
            // margin: const EdgeInsets.only(top: 150), //
            decoration: BoxDecoration(
                color: Colors.grey.shade500,
                gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color.fromARGB(115, 0, 0, 0),
                      Color.fromARGB(115, 0, 0, 0)
                    ])),
            child: NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (OverscrollIndicatorNotification notification) {
                notification.disallowIndicator();
                return true;
              },
              child: Column(
                children: [
                  Flexible(
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
                              gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.bottomLeft,
                                  colors: [
                                    Colors.white60,
                                    Colors.grey.shade100
                                  ]),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(25)),
                              color: Colors.white12.withOpacity(0.15),
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
                                          color: Colors.white70,
                                          fontSize: 25,
                                          fontWeight: FontWeight.w300,
                                          letterSpacing: 1)
                                      // style:  TextStyle(
                                      //     color: colorse[index], fontSize: 22,fontWeight: FontWeight.bold ),
                                      ),
                                ),
                                // SizedBox(
                                //   height: 1,
                                // )
                              ],
                            ),
                          ),
                        );
                      },
                      itemCount: colorse.length,
                    ),
                  )
                  // Container(
                  //   // margin: EdgeInsets.all(5),
                  //   height: 200,
                  //   decoration: BoxDecoration(
                  //       color: Colors.black54,
                  //       boxShadow: [
                  //         BoxShadow(
                  //           color: Colors.grey.shade800,
                  //           offset:const Offset(0.0, 1.0),
                  //           blurRadius: 1.0,
                  //         ),
                  //       ],

                  //       // color: Colors.red,
                  //       borderRadius: const BorderRadius.only(
                  //           bottomLeft: Radius.circular(40),
                  //           bottomRight: Radius.circular(10))),
                  //   padding: const EdgeInsets.only(top: 0, left: 10, right: 10),
                  // child:
                  //  Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Container(
                  //       height: 55,
                  //       width: 55,
                  //       decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.circular(30),
                  //           color: Colors.black12,
                  //           image: const DecorationImage(
                  //               image: AssetImage("assets/question.png"),
                  //               fit: BoxFit.fitHeight)),
                  //     ),

                  //     Container(
                  //       height: 60,
                  //       width: 60,
                  //       decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.circular(30),
                  //           color: Colors.black12,
                  //           image: const DecorationImage(
                  //               image: AssetImage("assets/setting.png"),
                  //               fit: BoxFit.fitHeight)),
                  //     ),
                  //   ],
                  // ),
                  // ),

                  // Expanded(
                  //   child: GridView.builder(
                  //       gridDelegate:
                  //           const SliverGridDelegateWithMaxCrossAxisExtent(
                  //               // crossAxisCount: 2,
                  //               // // crossAxisSpacing: 10.0,
                  //               // mainAxisSpacing: 0,
                  //               // childAspectRatio: 40 / 40

                  //               maxCrossAxisExtent: 200,
                  //               childAspectRatio: 4 / 3.8,
                  //               crossAxisSpacing: 6,
                  //               mainAxisSpacing: 0),
                  //       itemCount: colorse.length,
                  //       itemBuilder: (BuildContext ctx, index) {
                  //         return GestureDetector(
                  //           onTap: () {
                  //             Navigator.push(
                  //                 context,
                  //                 MaterialPageRoute(
                  //                   builder: (context) => navigators[index],
                  //                 ));
                  //           },
                  //           child: Container(
                  //             margin: const EdgeInsets.all(10),
                  //             decoration: BoxDecoration(
                  //               gradient: LinearGradient(
                  //                   begin: Alignment.centerLeft,
                  //                   end: Alignment.bottomLeft,
                  //                   colors: [
                  //                     Colors.white60,
                  //                     Colors.grey.shade100
                  //                   ]),
                  //               borderRadius:
                  //                   const BorderRadius.all(Radius.circular(25)),
                  //               color: Colors.white12.withOpacity(0.15),
                  //             ),
                  //             // margin:const EdgeInsets.only(top: 10),

                  //             child: Column(
                  //               children: [
                  //                 const SizedBox(
                  //                   height: 20,
                  //                 ),
                  //                 Image.asset(
                  //                   img[index],
                  //                   fit: BoxFit.fill,
                  //                   height: 50,
                  //                 ),

                  //                 Padding(
                  //                   padding:
                  //                       const EdgeInsets.only(top: 20, left: 5),
                  //                   child: Text(textes[index],
                  //                       overflow: TextOverflow.ellipsis,
                  //                       maxLines: 1,
                  //                       style: GoogleFonts.acme(
                  //                           color: Colors.white70,
                  //                           fontSize: 25,
                  //                           fontWeight: FontWeight.w300,
                  //                           letterSpacing: 1)
                  //                       // style:  TextStyle(
                  //                       //     color: colorse[index], fontSize: 22,fontWeight: FontWeight.bold ),
                  //                       ),
                  //                 ),
                  //                 // SizedBox(
                  //                 //   height: 1,
                  //                 // )
                  //               ],
                  //             ),
                  //           ),
                  //         );
                  //       }),
                  // ),
                ],
              ),
              //  Column(
              //   children: [
              // WaveWidget(
              //     waveFrequency: 2,
              //     config: CustomConfig(gradients: [
              //       [
              //         Color.fromARGB(255, 28, 115, 31),
              //         Color.fromARGB(255, 3, 68, 36)
              //       ],
              //       [
              //         Color(0xFFD76C9C),
              //         Color.fromARGB(255, 47, 23, 92)
              //       ],
              //       [Colors.indigo, Color(0xff7C4AA7)],
              //       [Colors.redAccent, Colors.pinkAccent],
              //       [
              //         Color(0xFFD76C9C),
              //         Color.fromARGB(255, 201, 35, 91)
              //       ],
              //     ], durations: [
              //       3500,
              //       19440,
              //       10800,
              //       6000,
              //       7500
              //     ], heightPercentages: [
              //       0.20,
              //       0.23,
              //       0.25,
              //       0.30,
              //       0.33
              //     ]),
              //     size: Size(double.infinity, 100)),
              // Flexible(
              //   flex: 0,
              //   child: ListView.builder(
              //     shrinkWrap: true,
              //     physics: NeverScrollableScrollPhysics(),
              //     itemCount: textes.length,
              //     itemBuilder: (context, index) {
              //       return GestureDetector(
              //         onTap: () {
              //           Navigator.push(
              //               context,
              //               MaterialPageRoute(
              //                 builder: (context) => navigator[index],
              //               ));
              //         },
              //         child: Stack(
              //           children: [
              //             Container(
              //               width: double.infinity,
              //               height: MediaQuery.of(context).size.height *
              //                   0.2,
              //               decoration: BoxDecoration(
              //                   color: conter[index],
              //                   border: Border.all(
              //                       width: 0, color: colorse[index])),
              //             ),
              //             Container(
              //               padding: const EdgeInsets.only(bottom: 0),
              //               margin: const EdgeInsets.only(bottom: 0),
              //               height: MediaQuery.of(context).size.height *
              //                   0.2,
              //               width: double.infinity,
              //               decoration: BoxDecoration(
              //                   border: Border.all(
              //                       width: 0, color: colorse[index]),
              //                   color: colorse[index],
              //                   borderRadius: const BorderRadius.only(
              //                       bottomLeft: Radius.circular(100))),
              //               child: Padding(
              //                   padding: const EdgeInsets.all(30),
              //                   child: HomeIcons(
              //                     index: index,
              //                     names: textes,
              //                     logimage: images,
              //                   )),
              //             ),
              //           ],
              //         ),
              //       );
              //     },
              //   ),
              // ),
              //   ],
              // ),
              // )
              // )
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
