import 'dart:async';

import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:octavision/controller/textrecoginseresult.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:flutter_tts/flutter_tts.dart';

class TextreconiseResult extends StatelessWidget {
  final String imagePath;
   TextreconiseResult({Key? key, required this.imagePath})
      : super(key: key);


  late final String _imagePath;
  final FlutterTts vioice = FlutterTts();
  final textrec = GoogleMlKit.vision.textRecognizer();

  Size? _imageSize;

  String barcoderesult = '';

  Future<void> _getImageSize(File imageFile) async {
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
    // setState(() {
      _imageSize = imageSize;
      textrrecoginseresultctrl.update();
    // });
  }

  void _recognizeImage() async {
    _getImageSize(File(_imagePath));
    final inputImage = InputImage.fromFilePath(_imagePath);
    final RecognizedText textex = await textrec.processImage(inputImage);
    // setState(() {
      barcoderesult = textex.text;

      if (barcoderesult.isNotEmpty) {
        speak(text: barcoderesult);
      } else {
        speak(text: "No Result Please try again");
      }
      textrrecoginseresultctrl.update();
    // });
  }

  speak({required String text}) async {
    // print(await vioice.getVoices);
    await vioice.setLanguage("en-US");
    // await vioice.setVoice({"name": "Karen", "locale": "en-AU"});
    await vioice.setPitch(1.5);
    await vioice.setSpeechRate(0.2);
    await vioice.speak(text);
  }

  
  final textrrecoginseresultctrl=Get.put(Textrecoginseresultcontroler());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title:const Text("Image Details"),
      ),
      body: GetBuilder<Textrecoginseresultcontroler>(
        dispose: (state) {
          textrec.close();
          vioice.stop();
        },
        initState: (state) {
          _imagePath=imagePath;
         
          _recognizeImage();
         
        },
        builder: (controller) => 
    _imageSize != null
            ? Stack(
                children: [
                  Container(
                    width: double.maxFinite,
                    color: Colors.black,
                    child: AspectRatio(
                      aspectRatio: _imageSize!.aspectRatio,
                      child: Image.file(
                        File(_imagePath),
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
                                child:barcoderesult.isNotEmpty
                                    ? Text(barcoderesult)
      
                                    
      
                                    : Text("No Result Please try again"),
                              ),
                            ),
                            
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
      ),
    );
  }
}
