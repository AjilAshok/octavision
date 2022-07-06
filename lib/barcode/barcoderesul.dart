import 'dart:io' as io;

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
// import 'package:google_mlkit_object_detection/google_mlkit_object_detection.dart';
import 'package:octavision/barcode/barcodecamera.dart';

import 'package:octavision/controller/textrecogtion_controller.dart';
import 'package:octavision/speack.dart';
// import 'package:objectdection/painters/objectdector_painer.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Barcodeview extends StatefulWidget {
  @override
  _Barcodeview createState() => _Barcodeview();
}

class _Barcodeview extends State<Barcodeview> {
  
  late BarcodeScanner barcodeScanner = BarcodeScanner();
  bool _canProcess = false;
  bool _isBusy = false;
  CustomPaint? _customPaint;
  String? _text;
  String result = '';
   String voices="Barcode";
  final textvoice=Voicespeeech();

  @override
  void initState() {
    super.initState();

    _initializeDetector();
    textvoice.speack(voices);
  }

  @override
  void dispose() {
    _canProcess = false;
    barcodeScanner.close();
    textvoice.speackvoice.stop();
    super.dispose();
  }

  // final barcodecontroller = Get.put(Textrecoginsecontroler());

  @override
  Widget build(BuildContext context) {
    return CameraView(
      
      title: 'Barcode',
      customPaint: _customPaint,
      text: _text,
      onImage: (inputImage) {
        processImage(inputImage, context);
      },
      initialDirection: CameraLensDirection.back,
    );
  }

  void _initializeDetector() async {
    _canProcess = true;
  }

  Future<void> processImage(InputImage inputImage, BuildContext ctx) async {
    if (!_canProcess) return;

    if (_isBusy) return;
    _isBusy = true;
    setState(() {
      _text = '';
    });
    final objects = await barcodeScanner.processImage(inputImage);
    if (inputImage.inputImageData?.size != null &&
        inputImage.inputImageData?.imageRotation != null) {
      for (Barcode borcodes in objects) {
        print("#########################");
        print(borcodes.displayValue);
        setState(() {
          result = borcodes.displayValue.toString();
        });

        if (result.isNotEmpty) {
          setState(() {
            // print(result);
            laughurls(result);

            _canProcess = false;
           
          });
        }
      }
    }
   
    _isBusy = false;
    
  }

 
  laughurls(String url) async {
    // var url=Uri.parse(url);
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw 'Not find';
    }
  }
}
