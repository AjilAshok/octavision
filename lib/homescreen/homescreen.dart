import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octavision/barcode/barcodecamera.dart';
import 'package:octavision/facedetction/facedectioncamera.dart';
import 'package:octavision/homescreen/widgets/appbarscreen.dart';
import 'package:octavision/homescreen/widgets/howescreenimagesicon.dart';
import 'package:octavision/imagelabeling/imagelabelecamera.dart';
import 'package:octavision/objectdetection/objectdetectioncam.dart';
import 'package:octavision/speechtotext/speechtotext.dart';
import 'package:octavision/textrecognise/textrecoginisecam.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  List images = [
    'https://static.vecteezy.com/system/resources/previews/005/680/276/large_2x/qr-code-scanning-app-icon-ui-ux-user-interface-2d-code-reading-app-matrix-barcode-scanner-two-dimensional-barcode-web-or-mobile-application-isolated-illustration-vector.jpg',
    'https://winaero.com/blog/wp-content/uploads/2019/11/Photos-new-icon.png',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR2VsJ_K6UUA2TOdu83uoDem5ulpvDiIXzbvA&usqp=CAU',
    'https://miro.medium.com/freeze/max/1000/1*PDA9zADqD9qqCu-CmJ9Ddw.gif',
    // 'https://miro.medium.com/freeze/max/1000/1*PDA9zADqD9qqCu-CmJ9Ddw.gif',
    // 'https://miro.medium.com/freeze/max/1000/1*PDA9zADqD9qqCu-CmJ9Ddw.gif'
  ];
  List textes = [
    "Barcode",
    "Image Label",
    "Text Recoginsise",
    "Face Detection"
  ];
  List navigator = [
    Camerabarcode(),
    Imagelabel_camera(),
    TextCam(),
    Facedetction_camera(),
    Objectdectioncam(),
  ];
  List colorse = [
    Color(0xFFD76C9C),
    Color(0xff7C4AA7),
    Color(0xFF140A27),
    Colors.indigo
  ];
  List conter = [
    Color(0xff7C4AA7),
    Color(0xFF140A27),
    Colors.indigo,
    Colors.white,
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: NestedScrollView(
              floatHeaderSlivers: true,
              headerSliverBuilder: ((context, innerBoxIsScrolled) => [
                    SliverAppBar(
                      //  floating: true,

                      toolbarHeight: 150,
                      backgroundColor: Color(0xFFD76C9C),
                      flexibleSpace: ClipPath(
                          clipper: Customsphape(),
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
                child: Column(
                  children: [
                    Flexible(
                      child: ListView.builder(
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
                                // Container(
                                //   height:
                                //       MediaQuery.of(context).size.height * 0.2,
                                //   color: Colors.red,
                                // ),
                                Container(
                                  padding:const EdgeInsets.all(0),
                                  decoration: BoxDecoration(
                                    // border: Border.all(color: Colors.green),
                                    color: conter[index],
                                  ),
                                  height:
                                      MediaQuery.of(context).size.height * 0.2,
                                ),
                                Container(
                                 
                                  height:
                                      MediaQuery.of(context).size.height * 0.2,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      // border: Border.all(
                                      //     width: 1.5, color: Colors.red),
                                      color: colorse[index],
                                      borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.circular(100))),
                                  child: Padding(
                                      padding: const EdgeInsets.all(30),
                                      child: HomeIcons(
                                        index: index,
                                        names: textes,
                                        logimage: images,
                                        
                                      )
                                      //  Row(
                                      //   children: [
                                      //     Text(
                                      //       textes[index],
                                      //       style: GoogleFonts.montserrat(
                                      //           color: Colors.white, fontSize: 23,fontWeight: FontWeight.bold),
                                      //     ),
                                      //   ],
                                      // ),
                                      ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              )

              // Padding(
              //   padding: const EdgeInsets.only(
              //     top: 20,
              //     left: 10,
              //     right: 10,
              //   ),
              //   child: GridView.builder(
              //       itemCount: images.length,
              //       gridDelegate:
              //           SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              //       itemBuilder: (context, index) {
              //         return GestureDetector(
              //           onTap: () {
              //             Navigator.push(
              //                 context,
              //                 MaterialPageRoute(
              //                   builder: (context) => navigator[index],
              //                 ));
              //           },
              //           child:
              //           Container(
              //             margin: EdgeInsets.all(10),
              //             child: Image.network(
              //               images[index],
              //               fit: BoxFit.fill,
              //             ),
              //             padding: EdgeInsets.all(20),
              //             decoration: BoxDecoration(
              //                 color: Colors.grey[200],
              //                 borderRadius: BorderRadius.circular(40),
              //                 boxShadow: [
              //                   // bottom right shadow is darker
              //                   const BoxShadow(
              //                       color: Colors.black,
              //                       offset: Offset(5, 5),
              //                       blurRadius: 15,
              //                       spreadRadius: 1),
              //                   // top left shadow lighter
              //                   BoxShadow(
              //                       color: Colors.grey.shade500,
              //                       offset: Offset(-5, -5),
              //                       blurRadius: 15,
              //                       spreadRadius: 1)
              //                 ]
              // ),
              //           ),
              //         );
              //       }),
              // ),
              )),
    );
  }
}
