import 'dart:async';

import 'dart:io' as io;
// import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:path/path.dart';

class Objectdection extends StatefulWidget {
  final String imagePath;
  const Objectdection({Key? key, required this.imagePath}) : super(key: key);

  @override
  State<Objectdection> createState() => _ObjectdectionState();
}

class _ObjectdectionState extends State<Objectdection> {
  late final String _imagePath;
  final FlutterTts vioice=FlutterTts();
   late ObjectDetector _objectDetector;
  // final objectdetc = GoogleMlKit.vision.objectDetector();

  Size? _imageSize;

  String objectresult = '';

  Future<void> _getImageSize(io.File imageFile) async {
    final Completer<Size> completer = Completer<Size>();

    final Image image = Image.file(imageFile);
    image.image.resolve(const ImageConfiguration()).addListener(
      ImageStreamListener((ImageInfo info, bool _) {
        completer.complete(Size(
          info.image.width.toDouble(),
          info.image.height.toDouble(),
        ));
      }),
    );

    final Size imageSize = await completer.future;
    setState(() {
      _imageSize = imageSize;
    });
  }

  void _recognizeImage() async {
    _getImageSize(io.File(_imagePath));
    initializeresult();
    final inputImage = InputImage.fromFilePath(_imagePath);
    final  objeresult =
        await _objectDetector.processImage(inputImage);
        for (DetectedObject obje in objeresult ) {
          for (Label label in obje.labels) {
            setState(() {
                print("888888888888888888888888888888888888888888888");
              print(label.text);
              
            });

            
          }
          
        }
       

  


  }
  // speak({required String text})async{
  //   // print(await vioice.getVoices);
  //   await vioice.setLanguage("en-US");
  //   // await vioice.setVoice({"name": "Karen", "locale": "en-AU"});
  //   await vioice.setPitch(1.5);
  //   await vioice.setSpeechRate(0.2);
  //   await vioice.speak(text);

  // }

  @override
  void initState() {
    _imagePath = widget.imagePath;

    // Initializing the Image Labeler
    // final objectdection= GoogleMlKit.vision.objectDetector();
    //  initializeresult();
     _recognizeImage();
   
  
   
    super.initState();
  }

  @override
  void dispose() {
    // Disposing the imageLabeler when not used anymore
    _objectDetector.close();
    vioice.stop();
    
    super.dispose();
  }
  void initializeresult()async{
    const path='assets/object_labeler.tflite';
    final modelpath=await _getModel(path);
    final options = LocalObjectDetectorOptions(
      modelPath: modelpath,
      classifyObjects: true,
      multipleObjects: true,
    );
     _objectDetector = ObjectDetector(options: options);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Image Details"),
      ),
      body: _imageSize != null
          ? Stack(
              children: [
                Container(
                  width: double.maxFinite,
                  color: Colors.black,
                  child: AspectRatio(
                    aspectRatio: _imageSize!.aspectRatio,
                    child: Image.file(
                    io.File(_imagePath),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Card(
                    elevation: 8,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(bottom: 8.0),
                            child: Text(
                              "Result",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 120,
                            child: SingleChildScrollView(
                              child:
                               objectresult.isNotEmpty? 
                               Text(objectresult)
                              
                              //  laughurls(barcoderesult):const Text("No Result Please try again"),
                                   
                                  : Text("No Result Please try again"),
                            ),
                          ),
                          // speak(text: barcoderesult)
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )
          : Container(
              color: Colors.blue,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
    );
  }

 Future<String> _getModel(String assetPath) async {
  
    if (io.Platform.isAndroid) {
       print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@22");
        
      return 'flutter_assets/$assetPath';
    }
    // print("!!!!!!!!!!!!!!!!!!111");
    final path = '${(await getApplicationSupportDirectory()).path}/$assetPath';
    await io.Directory(dirname(path)).create(recursive: true);
    final file = io.File(path);
    if (!await file.exists()) {
      final byteData = await rootBundle.load(assetPath);
      await file.writeAsBytes(byteData.buffer
          .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
    }
    
    print(file.path);
      
    return file.path;
  }
}
