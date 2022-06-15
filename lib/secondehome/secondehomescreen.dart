import 'dart:ui';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:octavision/barcode/barcodecamera.dart';
import 'package:octavision/barcode/barcoderesul.dart';
import 'package:octavision/currencydetection/currencycamer.dart';
import 'package:octavision/facedetction/facedectioncamera.dart';
import 'package:octavision/imagelabeling/imagelabelecamera.dart';
import 'package:octavision/languagetranslation/translation.dart';
import 'package:octavision/main.dart';
import 'package:octavision/objectdetection/objectdetectioncam.dart';
import 'package:octavision/textrecognise/textrecoginisecam.dart';

class SecondhomeScreen extends StatefulWidget {
  const SecondhomeScreen({Key? key}) : super(key: key);

  @override
  State<SecondhomeScreen> createState() => _SecondhomeScreenState();
}

class _SecondhomeScreenState extends State<SecondhomeScreen> {
  PageController controller = PageController();
  List images = [
    'https://static.vecteezy.com/system/resources/previews/005/680/276/large_2x/qr-code-scanning-app-icon-ui-ux-user-interface-2d-code-reading-app-matrix-barcode-scanner-two-dimensional-barcode-web-or-mobile-application-isolated-illustration-vector.jpg',
    'https://winaero.com/blog/wp-content/uploads/2019/11/Photos-new-icon.png',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR2VsJ_K6UUA2TOdu83uoDem5ulpvDiIXzbvA&usqp=CAU',
    'https://miro.medium.com/freeze/max/1000/1*PDA9zADqD9qqCu-CmJ9Ddw.gif',
    'https://miro.medium.com/freeze/max/1000/1*PDA9zADqD9qqCu-CmJ9Ddw.gif',
    'https://miro.medium.com/freeze/max/1000/1*PDA9zADqD9qqCu-CmJ9Ddw.gif'
  ];
  List navigator = [
    // const Objectdectioncam(),
     TextCam(),
     Currencydection(),
     Facedetction_camera(),
    Barcodeview(),
     Imagelabel_camera(),

    // const SpeechToText()
  ];

  // late final CameraController _controller;
  // final ImagePicker picker = ImagePicker();
  // PageController pageController = PageController(initialPage: 0);
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   // _initializeCamera();
  // }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    // _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //  picikimage();

    return SafeArea(
        child: Scaffold(
            body: PageView(
      // pageSnapping: true,
      scrollDirection: Axis.vertical,
      children:  [
        // Objectdectioncam(),
        TextCam(),
        Translationmodel(),
        Currencydection(),
        Facedetction_camera(),

        Imagelabel_camera(),
        // Camerabarcode(),
      ],
    )));
  }
}
