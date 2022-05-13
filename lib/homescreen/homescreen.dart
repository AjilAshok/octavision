import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:octavision/barcode/barcodecamera.dart';
import 'package:octavision/facedetction/facedectioncamera.dart';
import 'package:octavision/imagelabeling/imagelabelecamera.dart';
import 'package:octavision/objectdetection/objectdetectioncam.dart';
import 'package:octavision/textrecognise/textrecoginisecam.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  List images = [
    'https://static.vecteezy.com/system/resources/previews/005/680/276/large_2x/qr-code-scanning-app-icon-ui-ux-user-interface-2d-code-reading-app-matrix-barcode-scanner-two-dimensional-barcode-web-or-mobile-application-isolated-illustration-vector.jpg',
    'https://winaero.com/blog/wp-content/uploads/2019/11/Photos-new-icon.png',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR2VsJ_K6UUA2TOdu83uoDem5ulpvDiIXzbvA&usqp=CAU',
    'https://miro.medium.com/freeze/max/1000/1*PDA9zADqD9qqCu-CmJ9Ddw.gif',
    'https://miro.medium.com/freeze/max/1000/1*PDA9zADqD9qqCu-CmJ9Ddw.gif'
    
  ];
  List navigator = [Camerabarcode(),Imagelabel_camera(),TextCam(),Facedetction_camera(),Objectdectioncam()];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
        ),
        backgroundColor: Colors.grey,
        body: Padding(
          padding: const EdgeInsets.only(
            top: 20,
            left: 10,
            right: 10,
          ),
          child: GridView.builder(
              itemCount: images.length,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => navigator[index],
                        ));
                  },
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: Image.network(
                      images[index],
                      fit: BoxFit.fill,
                    ),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(40),
                        boxShadow: [
                          // bottom right shadow is darker
                          const BoxShadow(
                              color: Colors.black,
                              offset: Offset(5, 5),
                              blurRadius: 15,
                              spreadRadius: 1),
                          // top left shadow lighter
                          BoxShadow(
                              color: Colors.grey.shade500,
                              offset: Offset(-5, -5),
                              blurRadius: 15,
                              spreadRadius: 1)
                        ]),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
