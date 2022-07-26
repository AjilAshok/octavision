// import 'dart:async';

// import 'dart:io' as io;
// // import 'dart:io';

// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:google_ml_kit/google_ml_kit.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:url_launcher/url_launcher_string.dart';
// import 'package:flutter_tts/flutter_tts.dart';
// import 'package:path/path.dart';

// class Objectdection extends StatefulWidget {
//   final String imagePath;
//   const Objectdection({Key? key, required this.imagePath}) : super(key: key);

//   @override
//   State<Objectdection> createState() => _ObjectdectionState();
// }

// class _ObjectdectionState extends State<Objectdection> {
//   late final String _imagePath;
//   final FlutterTts vioice=FlutterTts();
//    late ObjectDetector _objectDetector;
//   // final objectdetc = GoogleMlKit.vision.objectDetector();

//   Size? _imageSize;

//   String objectresult = '';

//   Future<void> _getImageSize(io.File imageFile) async {
//     final Completer<Size> completer = Completer<Size>();

//     final Image image = Image.file(imageFile);
//     image.image.resolve(const ImageConfiguration()).addListener(
//       ImageStreamListener((ImageInfo info, bool _) {
//         completer.complete(Size(
//           info.image.width.toDouble(),
//           info.image.height.toDouble(),
//         ));
//       }),
//     );

//     final Size imageSize = await completer.future;
//     setState(() {
//       _imageSize = imageSize;
//     });
//   }

//   void _recognizeImage() async {
//     _getImageSize(io.File(_imagePath));
//     initializeresult();
//     final inputImage = InputImage.fromFilePath(_imagePath);
//     final  objeresult =
//         await _objectDetector.processImage(inputImage);
//         for (DetectedObject obje in objeresult ) {
//           for (Label label in obje.labels) {
//             print(label.text);
//             setState(() {
//                 print("888888888888888888888888888888888888888888888");
//               print(label.text);
              
//             });

            
//           }
          
//         }
       

  


//   }
//   // speak({required String text})async{
//   //   // print(await vioice.getVoices);
//   //   await vioice.setLanguage("en-US");
//   //   // await vioice.setVoice({"name": "Karen", "locale": "en-AU"});
//   //   await vioice.setPitch(1.5);
//   //   await vioice.setSpeechRate(0.2);
//   //   await vioice.speak(text);

//   // }

//   @override
//   void initState() {
//     _imagePath = widget.imagePath;

//     // Initializing the Image Labeler
//     // final objectdection= GoogleMlKit.vision.objectDetector();
//     //  initializeresult();
//      _recognizeImage();
   
  
   
//     super.initState();
//   }

//   @override
//   void dispose() {
//     // Disposing the imageLabeler when not used anymore
//     _objectDetector.close();
//     vioice.stop();
    
//     super.dispose();
//   }
//   void initializeresult()async{
//     const path='assets/object_labeler.tflite';
//     final modelpath=await _getModel(path);
//     final options = LocalObjectDetectorOptions(
//       mode: DetectionMode.singleImage,
//       modelPath: modelpath,
//       classifyObjects: true,
//       multipleObjects: true,
//     );
//      _objectDetector = ObjectDetector(options: options);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         title: Text("Image Details"),
//       ),
//       body: _imageSize != null
//           ? Stack(
//               children: [
//                 Container(
//                   width: double.maxFinite,
//                   color: Colors.black,
//                   child: AspectRatio(
//                     aspectRatio: _imageSize!.aspectRatio,
//                     child: Image.file(
//                     io.File(_imagePath),
//                     ),
//                   ),
//                 ),
//                 Align(
//                   alignment: Alignment.bottomCenter,
//                   child: Card(
//                     elevation: 8,
//                     color: Colors.white,
//                     child: Padding(
//                       padding: const EdgeInsets.all(16.0),
//                       child: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const Padding(
//                             padding: EdgeInsets.only(bottom: 8.0),
//                             child: Text(
//                               "Result",
//                               style: TextStyle(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                           Container(
//                             width: double.infinity,
//                             height: 120,
//                             child: SingleChildScrollView(
//                               child:
//                                objectresult.isNotEmpty? 
//                                Text(objectresult)
                              
//                               //  laughurls(barcoderesult):const Text("No Result Please try again"),
                                   
//                                   : Text("No Result Please try again"),
//                             ),
//                           ),
//                           // speak(text: barcoderesult)
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             )
//           : Container(
//               color: Colors.blue,
//               child: Center(
//                 child: CircularProgressIndicator(),
//               ),
//             ),
//     );
//   }

//  Future<String> _getModel(String assetPath) async {
  
//     if (io.Platform.isAndroid) {
//        print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@22");
        
//       return 'flutter_assets/$assetPath';
//     }
//     // print("!!!!!!!!!!!!!!!!!!111");
//     final path = '${(await getApplicationSupportDirectory()).path}/$assetPath';
//     await io.Directory(dirname(path)).create(recursive: true);
//     final file = io.File(path);
//     if (!await file.exists()) {
//       final byteData = await rootBundle.load(assetPath);
//       await file.writeAsBytes(byteData.buffer
//           .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
//     }
    
//     print(file.path);
      
//     return file.path;
//   }
// }



import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mlkit_commons/google_mlkit_commons.dart';
import 'package:image_picker/image_picker.dart';
import 'package:octavision/controller/textrecogtion_controller.dart';
import 'package:octavision/spinneranimation.dart';

import '../main.dart';

enum ScreenMode { liveFeed, gallery }

class CameraView extends StatefulWidget {
  CameraView(
      {Key? key,
      required this.title,
      required this.customPaint,
      required this.result,
      this.text,
      required this.onImage,
      this.onScreenModeChanged,
      this.initialDirection = CameraLensDirection.back
      })
      : super(key: key);

  final String title;
  final CustomPaint? customPaint;
  final String? text;
  final Function(InputImage inputImage) onImage;
  final Function(ScreenMode mode)? onScreenModeChanged;
  final CameraLensDirection initialDirection;
  List<String> result;

  @override
  _CameraViewState createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> {
  final controlerr=Get.put(Textrecoginsecontroler());
  ScreenMode _mode = ScreenMode.liveFeed;
  CameraController? _controller;
  File? _image;
  String? _path;
  ImagePicker? _imagePicker;
  int _cameraIndex = 0;
  double zoomLevel = 0.0, minZoomLevel = 0.0, maxZoomLevel = 0.0;
  final bool _allowPicker = true;
  bool _changingCameraLens = false;
   final control=Get.put(Textrecoginsecontroler());  

  @override
  void initState() {
    super.initState();

    _imagePicker = ImagePicker();

    if (cameras.any(
      (element) =>
          element.lensDirection == widget.initialDirection &&
          element.sensorOrientation == 90,
    )) {
      _cameraIndex = cameras.indexOf(
        cameras.firstWhere((element) =>
            element.lensDirection == widget.initialDirection &&
            element.sensorOrientation == 90),
      );
    } else {
      _cameraIndex = cameras.indexOf(
        cameras.firstWhere(
          (element) => element.lensDirection == widget.initialDirection,
        ),
      );
    }

    _startLiveFeed();
  }

  @override
  void dispose() {
    _stopLiveFeed();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(widget.title),
     
      ),
      body: _body(),
      // floatingActionButton: _floatingActionButton(),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget? _floatingActionButton() {
    if (_mode == ScreenMode.gallery) return null;
    if (cameras.length == 1) return null;
    return SizedBox(
        height: 70.0,
        width: 70.0,
        child: FloatingActionButton(
          child: Icon(
            Platform.isIOS
                ? Icons.flip_camera_ios_outlined
                : Icons.flip_camera_android_outlined,
            size: 40,
          ),
          onPressed: _switchLiveCamera,
        ));
  }

  Widget _body() {
    Widget body;
    if (_mode == ScreenMode.liveFeed) {
      body = _liveFeedBody();
    } else {
      body = _galleryBody();
    }
    return body;
  }

  Widget _liveFeedBody() {
    if (_controller?.value.isInitialized == false) {
      return const Spinner_lodading();
    }

    final size = MediaQuery.of(context).size;
    
    var scale = size.aspectRatio * _controller!.value.aspectRatio;

    // to prevent scaling down, invert the value
    if (scale < 1) scale = 1 / scale;

    return Container(
      color: Colors.black,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Transform.scale(
            scale: scale,
            child: Center(
              child: _changingCameraLens
                  ? Center(
                      child: const Text('Changing camera lens'),
                    )
                  : CameraPreview(_controller!),
            ),
          ),
          if (widget.customPaint != null) widget.customPaint!,
          Positioned(
            bottom: 100,
            left: 50,
            right: 50,
            child: Slider(
              value: zoomLevel,
              min: minZoomLevel,
              max: maxZoomLevel,
              onChanged: (newSliderValue) {
                setState(() {
                  zoomLevel = newSliderValue;
                  _controller!.setZoomLevel(zoomLevel);
                });
              },
              divisions: (maxZoomLevel - 1).toInt() < 1
                  ? null
                  : (maxZoomLevel - 1).toInt(),
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            height: MediaQuery.of(context).size.height*0.2,
            child: Text(widget.result.toString()),
          )
        ],
      ),
    );
  }

  Widget _galleryBody() {
    return ListView(shrinkWrap: true, children: [
      _image != null
          ? SizedBox(
              height: 400,
              width: 400,
              child: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Image.file(_image!),
                  if (widget.customPaint != null) widget.customPaint!,
                ],
              ),
            )
          : Icon(
              Icons.image,
              size: 200,
            ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: ElevatedButton(
          child: Text('From Gallery'),
          onPressed: () => _getImage(ImageSource.gallery),
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: ElevatedButton(
          child: Text('Take a picture'),
          onPressed: () => _getImage(ImageSource.camera),
        ),
      ),
      if (_image != null)
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
              '${_path == null ? '' : 'Image path: $_path'}\n\n${widget.text ?? ''}'),
        ),
        Container(
          height: MediaQuery.of(context).size.height*.2,
          // child:Text(widget.result.toString()) ,
        )

    ]);
  }

  Future _getImage(ImageSource source) async {
    setState(() {
      _image = null;
      _path = null;
    });
    final pickedFile = await _imagePicker?.pickImage(source: source);
    if (pickedFile != null) {
      _processPickedFile(pickedFile);
    }
    setState(() {});
  }

  void _switchScreenMode() {
    _image = null;
    if (_mode == ScreenMode.liveFeed) {
      _mode = ScreenMode.gallery;
      _stopLiveFeed();
    } else {
      _mode = ScreenMode.liveFeed;
      _startLiveFeed();
    }
    if (widget.onScreenModeChanged != null) {
      widget.onScreenModeChanged!(_mode);
    }
    setState(() {});
  }

  Future _startLiveFeed() async {
    final camera = cameras[_cameraIndex];
    _controller = CameraController(
      camera,
      ResolutionPreset.high,
      enableAudio: false,
    );
    _controller?.initialize().then((_) {
      if (!mounted) {
        return;
      }
      _controller?.getMinZoomLevel().then((value) {
        zoomLevel = value;
        minZoomLevel = value;
      });
      _controller?.getMaxZoomLevel().then((value) {
        maxZoomLevel = value;
      });
      _controller?.startImageStream(_processCameraImage);
      setState(() {});
    });
   
  
  }

  Future _stopLiveFeed() async {
    await _controller?.stopImageStream();
    await _controller?.dispose();
    await controlerr.controller.initialize();
    _controller = null;
  }

  Future _switchLiveCamera() async {
    setState(() => _changingCameraLens = true);
    _cameraIndex = (_cameraIndex + 1) % cameras.length;

    await _stopLiveFeed();
    await _startLiveFeed();
    setState(() => _changingCameraLens = false);
  }

  Future _processPickedFile(XFile? pickedFile) async {
    final path = pickedFile?.path;
    if (path == null) {
      return;
    }
    setState(() {
      _image = File(path);
    });
    _path = path;
    final inputImage = InputImage.fromFilePath(path);
    widget.onImage(inputImage);
  }

  Future _processCameraImage(CameraImage image) async {
    final WriteBuffer allBytes = WriteBuffer();
    for (final Plane plane in image.planes) {
      allBytes.putUint8List(plane.bytes);
    }
    final bytes = allBytes.done().buffer.asUint8List();

    final Size imageSize =
        Size(image.width.toDouble(), image.height.toDouble());

    final camera = cameras[_cameraIndex];
    final imageRotation =
        InputImageRotationValue.fromRawValue(camera.sensorOrientation);
    if (imageRotation == null) return;

    final inputImageFormat =
        InputImageFormatValue.fromRawValue(image.format.raw);
    if (inputImageFormat == null) return;

    final planeData = image.planes.map(
      (Plane plane) {
        return InputImagePlaneMetadata(
          bytesPerRow: plane.bytesPerRow,
          height: plane.height,
          width: plane.width,
        );
      },
    ).toList();

    final inputImageData = InputImageData(
      size: imageSize,
      imageRotation: imageRotation,
      inputImageFormat: inputImageFormat,
      planeData: planeData,
    );

    final inputImage =
        InputImage.fromBytes(bytes: bytes, inputImageData: inputImageData);

    widget.onImage(inputImage);
  }
}
