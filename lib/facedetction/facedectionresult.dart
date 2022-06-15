import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'dart:ui' as ui;

import 'package:octavision/controller/textrecoginseresult.dart';

class Facedection extends StatelessWidget {
  final String imagePath;
   Facedection({Key? key, required this.imagePath}) : super(key: key);


  final facedectionresultcontroler = Get.put(Textrecoginseresultcontroler());
  ui.Image? image;
  List<Rect> rect = [];
  late final String _imagePath;
  int? lengthoflist;
  final FlutterTts tts = FlutterTts();
  final facedection = GoogleMlKit.vision.faceDetector();

  Future<ui.Image?> loadimage(File img) async {
    var imge = await img.readAsBytes();
    return await decodeImageFromList(imge);
  }

  speak({required String text}) async {
    // print(await vioice.getVoices);
    await tts.setLanguage("en-US");
    // await vioice.setVoice({"name": "Karen", "locale": "en-AU"});
    await tts.setPitch(1.5);
    await tts.setSpeechRate(0.2);
    await tts.speak("There is $text person");
  }

  void _recognizeImage() async {
    loadimage(File(_imagePath)).then((im) {
      
      image = im;
      facedectionresultcontroler.update();
      
    });
    //  _getImageSize(File(_imagePath));
    final inputImage = InputImage.fromFilePath(_imagePath);

    final List<Face> faces = await facedection.processImage(inputImage);

   
    lengthoflist = faces.length;

    speak(text: lengthoflist.toString());
  
    facedectionresultcontroler.update();

    for (Face f in faces) {
    
      rect.add(f.boundingBox);
    
      facedectionresultcontroler.update();
    }
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<Textrecoginseresultcontroler>(
        dispose: (state) {
          facedection.close();
          tts.stop();
          
        },
        initState: (state) {
          _imagePath = imagePath;

          _recognizeImage();
        },
        builder: (controllers) => Column(
          children: [
            image == null
                ? const CircularProgressIndicator()
                : FittedBox(
                    child: SizedBox(
                      height: image!.height.toDouble(),
                      width: image!.width.toDouble(),
                      child: CustomPaint(
                        painter: Painter(rect: rect, image: image!),
                      ),
                    ),
                  ),
            lengthoflist == null
                ? const CircularProgressIndicator()
                : Container(
                    margin: EdgeInsets.only(top: 25),
                    child: Text(
                      "There is ${lengthoflist.toString()} person",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}

class Painter extends CustomPainter {
  List<Rect> rect = [];
  ui.Image image;
  Painter({required this.rect, required this.image});

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawImage(image, Offset.zero, Paint());

    for (Rect rec in rect) {
      canvas.drawRect(
          rec,
          Paint()
            ..color = Colors.green
            ..strokeWidth = 4.0
            ..style = PaintingStyle.stroke);
    }
    // TODO: implement paint
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
