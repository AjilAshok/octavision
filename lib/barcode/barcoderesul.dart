import 'dart:io' as io;

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
// import 'package:google_mlkit_object_detection/google_mlkit_object_detection.dart';
import 'package:octavision/barcode/barcodecamera.dart';

import 'package:octavision/controller/textrecogtion_controller.dart';
// import 'package:objectdection/painters/objectdector_painer.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher_string.dart';

// import '../activityindicator/activitity.dart';

// import 'camera_view.dart';
// import 'painters/object_detector_painter.dart';

class Barcodeview extends StatefulWidget {
  @override
  _Barcodeview createState() => _Barcodeview();
}

class _Barcodeview extends State<Barcodeview> {
  // late ObjectDetector _objectDetector;
  late BarcodeScanner barcodeScanner = BarcodeScanner();
  bool _canProcess = false;
  bool _isBusy = false;
  CustomPaint? _customPaint;
  String? _text;
  String result = '';

  @override
  void initState() {
    super.initState();

    _initializeDetector();
  }

  @override
  void dispose() {
    _canProcess = false;
    barcodeScanner.close();
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
            print(result);
            laughurls(result);

            _canProcess = false;
            // _barcodeScanner.close();
            // Navigator.pushReplacement(ctx, MaterialPageRoute(builder: (context) =>Barcodeshowpage(result: result) ,));
          });
        }
      }
    }
    // else {

    //   String text = 'Objects found: ${objects.length}\n\n';
    //   for (final barcodes in objects) {

    //     text +=barcodes.rawValue.toString();
    //     print("44444");
    //     print(text);

    //         // 'Object:  trackingId: ${object.displayValue} - ${object.displayValue.map((e) => e.text)}\n\n';
    //   }

    //   //  for (DetectedObject object in objects) {
    //   //     setState(() {
    //   //       // print("888888888888888888888888888888888888888888888");
    //   //       // print(object.trackingId);
    //   //       // // text +=
    //   //       // 'Object:  trackingId: ${object.trackingId} - ${object.labels.map((e) => e.text)}\n\n';
    //   //       for (Label label in object.labels) {
    //   //         print("888888888888888888888888888888888888888888888");
    //   //         // speak(label.text);

    //   //         print(label.text);
    //   //       }
    //   //     });
    //   //   }
    //   _text = text;
    //   // TODO: set _customPaint to draw boundingRect on top of image
    //   _customPaint = null;
    // }
    _isBusy = false;
    // if (mounted) {
    //   setState(() {});
    // }
  }

  // Future<String> _getModel(String assetPath) async {
  //   if (io.Platform.isAndroid) {
  //     return 'flutter_assets/$assetPath';
  //   }
  //   final path = '${(await getApplicationSupportDirectory()).path}/$assetPath';
  //   await io.Directory(dirname(path)).create(recursive: true);
  //   final file = io.File(path);
  //   if (!await file.exists()) {
  //     final byteData = await rootBundle.load(assetPath);
  //     await file.writeAsBytes(byteData.buffer
  //         .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
  //   }
  //   return file.path;
  // }
  laughurls(String url) async {
    // var url=Uri.parse(url);
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw 'Not find';
    }
  }
}
