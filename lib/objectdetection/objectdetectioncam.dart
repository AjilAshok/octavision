// import 'package:camera/camera.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get_state_manager/get_state_manager.dart';
// import 'package:octavision/controller/textrecogtion_controller.dart';
// import 'package:octavision/facedetction/facedectionresult.dart';
// import 'package:octavision/main.dart';
// import 'package:octavision/objectdetection/objectdecresult.dart';

// class Objectdectioncam extends StatelessWidget {
//   const Objectdectioncam({ Key? key }) : super(key: key);

// //   @override
// //   State<Objectdectioncam> createState() => _CameraviewState();
// // }


// // class _CameraviewState extends State<Objectdectioncam> {
//   // late final CameraController _controller;
//   // void _initializeCamera() async {
//   //   final CameraController cameraController = CameraController(
//   //     cameras[0],
//   //     ResolutionPreset.high,
//   //   );
//   //   _controller = cameraController;
  
//   //   _controller.initialize().then((_) {
//   //     if (!mounted) {
//   //       return;
//   //     }
//   //     setState(() {});
//   //   });
//   // }
//   //  Future<String?> _takePicture() async {
//   //   if (!_controller.value.isInitialized) {
//   //     print("Controller is not initialized");
//   //     return null;
//   //   }
  
//   //   String? imagePath;
  
//   //   if (_controller.value.isTakingPicture) {
//   //     print("Processing is progress ...");
//   //     return null;
//   //   }
  
//   //   try {
        
//   //     // Turning off the camera flash
//   //     _controller.setFlashMode(FlashMode.off);
        
//   //     // Returns the image in cross-platform file abstraction
//   //     final XFile file = await _controller.takePicture();
        
//   //     // Retrieving the path
//   //     imagePath = file.path;
//   //   } on CameraException catch (e) {
//   //     print("Camera Exception: $e");
//   //     return null;
//   //   }
  
//   //   return imagePath;
//   // }
//   // @override
//   // void initState() {
//   //   // TODO: implement initState
//   //   // _initializeCamera();
//   //   super.initState();
//   // }
//   // @override
//   // void dispose() {
//   //   // TODO: implement dispose
//   //   super.dispose();
//   //   // _controller.dispose();
//   // }
//   @override
  
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // backgroundColor: Colors.black,
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         title: Text("Object Detection"),),
//       body: GetBuilder<Textrecoginsecontroler>(
//         builder: (controllers) => 
//          GestureDetector(
//           onTap: () async{
//               await controllers.takePicture().then((String? path) {
//                               if (path != null) {
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder: (context) => Objectdection(
//                                       imagePath: path,
//                                     ),
//                                   ),
//                                 );
//                               } else {
//                                 print('Image path not found!');
//                               }
//                             });
      
//           },
//           child:controllers.controller.value.isInitialized
//               ? Stack(
//                   children: [
//                     CameraPreview(controllers.controller),
//                     // Padding(
//                     //   padding: const EdgeInsets.all(20.0),
//                     //   child: Container(
//                     //     alignment: Alignment.bottomCenter,
//                     //     child: ElevatedButton.icon(
//                     //       style: ButtonStyle(backgroundColor:MaterialStateProperty.all(Colors.black)),
//                     //       icon: Icon(Icons.camera,color: Colors.white,),
//                     //       label: Text("Click"),
//                     //       onPressed: () async {
                              
//                     //         // If the returned path is not null navigate
//                     //         // to the DetailScreen
//                     //         await _takePicture().then((String? path) {
//                     //           if (path != null) {
//                     //             Navigator.push(
//                     //               context,
//                     //               MaterialPageRoute(
//                     //                 builder: (context) => Objectdection(
//                     //                   imagePath: path,
//                     //                 ),
//                     //               ),
//                     //             );
//                     //           } else {
//                     //             print('Image path not found!');
//                     //           }
//                     //         });
//                     //       },
//                     //     ),
//                     //   ),
//                     // )
//                   ],
//                 )
//               : Container(
//                   color: Colors.black,
//                   child: Center(
//                     child: CircularProgressIndicator(),
//                   ),
//                 ),
//         ),
//       ),
//     );
//   }
      
    
  
  

// }



import 'dart:io' as io;

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mlkit_object_detection/google_mlkit_object_detection.dart';
import 'package:octavision/objectdetection/objectdecresult.dart';
import 'package:octavision/objectdetection/painter/painter.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';



class ObjectDetectorView extends StatefulWidget {
  @override
  _ObjectDetectorView createState() => _ObjectDetectorView();
}

class _ObjectDetectorView extends State<ObjectDetectorView> {
  late ObjectDetector _objectDetector;
  bool _canProcess = false;
  bool _isBusy = false;
  CustomPaint? _customPaint;
  String? _text;
  List<String> results=[];

  @override
  void initState() {
    super.initState();

    _initializeDetector(DetectionMode.stream);
  }

  @override
  void dispose() {
    _canProcess = false;
    _objectDetector.close();
  // results.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return
    // ElevatedButton(onPressed: (){}, child:Text("dsgsg"));
    CameraView(
      result: results,
      title: 'Object Detector',
      customPaint: _customPaint,
      text: _text,
      onImage: (inputImage) {
        processImage(inputImage);
      },
      onScreenModeChanged: _onScreenModeChanged,
      initialDirection: CameraLensDirection.back,
    );
  }

  void _onScreenModeChanged(ScreenMode mode) {
    switch (mode) {
      case ScreenMode.gallery:
        _initializeDetector(DetectionMode.singleImage);
        return;

      case ScreenMode.liveFeed:
        _initializeDetector(DetectionMode.stream);
        return;
    }
  }

  void _initializeDetector(DetectionMode mode) async {
    print("@@@@@@@@@@@@@@2");
    print('Set detector in mode: $mode');

    
    final path = 'assets/object_labeler.tflite';
    final modelPath = await _getModel(path);
    final options = LocalObjectDetectorOptions(
      mode: mode,
      modelPath: modelPath,
      classifyObjects: true,
      multipleObjects: true,
    );
    _objectDetector = ObjectDetector(options: options);

   

    _canProcess = true;
  }

  Future<void> processImage(InputImage inputImage) async {
    if (!_canProcess) return;
    if (_isBusy) return;
    _isBusy = true;
    setState(() {
      _text = '';
    });
    final objects = await _objectDetector.processImage(inputImage); 
    if (inputImage.inputImageData?.size != null &&
        inputImage.inputImageData?.imageRotation != null) {
      final painter = ObjectDetectorPainter(
          objects,
          inputImage.inputImageData!.imageRotation,
          inputImage.inputImageData!.size);
      _customPaint = CustomPaint(painter: painter);
      for (DetectedObject obj in objects) {
        results.clear();
    //  print(   obj.labels.map((e) => e.text));
     setState(() {
      //  _text=obj.labels.map((e) => e.text);
      results.add(obj.labels.map((e) => e.text).toString());
      print(results);
       
     });

      }
    } else {
      String text = 'Objects found: ${objects.length}\n\n';
      for (final object in objects) {
        text +=
            'Object:  trackingId: ${object.trackingId} - ${object.labels.map((e) => e.text)}\n\n';
      }
      _text = text;
      // TODO: set _customPaint to draw boundingRect on top of image
      _customPaint = null;
    }
    _isBusy = false;
    if (mounted) {
      setState(() {});
    }
  }

  Future<String> _getModel(String assetPath) async {
    if (io.Platform.isAndroid) {
      return 'flutter_assets/$assetPath';
    }
    final path = '${(await getApplicationSupportDirectory()).path}/$assetPath';
    await io.Directory(dirname(path)).create(recursive: true);
    final file = io.File(path);
    if (!await file.exists()) {
      final byteData = await rootBundle.load(assetPath);
      await file.writeAsBytes(byteData.buffer
          .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
    }
    return file.path;
  }
}