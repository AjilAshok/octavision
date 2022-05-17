import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'dart:ui' as ui;

class Facedection extends StatefulWidget {
  final String imagePath;
  const Facedection({Key? key, required this.imagePath}) : super(key: key);

  @override
  State<Facedection> createState() => _FacedectionState();
}

class _FacedectionState extends State<Facedection> {
  ui.Image? image;
  List<Rect> rect = [];
  late final String _imagePath;
  int? lengthoflist;
   final FlutterTts tts=FlutterTts();
  final facedection = GoogleMlKit.vision.faceDetector();
  // Size? _imageSize;
  // Future<void> _getImageSize(File imageFile) async {
  //   final Completer<Size> completer = Completer<Size>();

  //   final Image image = Image.file(imageFile);
  //   image.image.resolve(const ImageConfiguration()).addListener(
  //     ImageStreamListener((ImageInfo info, bool _) {
  //       completer.complete(Size(
  //         info.image.width.toDouble(),
  //         info.image.height.toDouble(),
  //       ));
  //     }),
  //   );

  //   final Size imageSize = await completer.future;
  //   setState(() {
  //     _imageSize = imageSize;
  //   });
  // }

  Future<ui.Image?> loadimage(File img) async {
    var imge = await img.readAsBytes();
    return await decodeImageFromList(imge);
  }
  speak({required String text})async{
    // print(await vioice.getVoices);
    await tts.setLanguage("en-US");
    // await vioice.setVoice({"name": "Karen", "locale": "en-AU"});
    await tts.setPitch(1.5);
    await tts.setSpeechRate(0.2);
    await tts.speak("There is $text person");

  }

  void _recognizeImage() async {
    loadimage(File(_imagePath)).then((im) {
      setState(() {
        image = im;
      });
    });
    //  _getImageSize(File(_imagePath));
    final inputImage = InputImage.fromFilePath(_imagePath);

    final List<Face> faces = await facedection.processImage(inputImage);

    print("************************************************");
    print(faces.length);
    setState(() {
      lengthoflist=faces.length;
     
        speak(text: lengthoflist.toString());
      
    });

    for (Face f in faces) {
      setState(() {
        rect.add(f.boundingBox);
      });

      print(rect);
      print("!!!!!!!!!!!!!!!!!!!!!!!!!1");
    }
    // for (Barcode barco in barcodes) {

    // final String barcod=barco.displayValue.toString();
    // // final int index = label.index;DetailScreenDetailScreen
    // // final double confidence = label.confidence;
    // setState(() {
    //   	// imagesData.add(item);
    // // indexData.add(index.toString());

    // print(barcod);

    // });

    // }
  }

  @override
  void initState() {
    _imagePath = widget.imagePath;

    // Initializing the Image Labeler
    // final objectdection= GoogleMlKit.vision.objectDetector();
    _recognizeImage();
    super.initState();
  }

  @override
  void dispose() {
    // Disposing the imageLabeler when not used anymore
    facedection.close();
    tts.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Column(
            children: [
              image == null
                  ?const CircularProgressIndicator()
                  : FittedBox(
                      child: SizedBox(
                        height: image!.height.toDouble(),
                        width: image!.width.toDouble(),
                        child: CustomPaint(
                          painter: Painter(rect: rect, image: image!),
                        ),
                      ),
                    ),
                    lengthoflist==null?const CircularProgressIndicator():Container(
                      margin: EdgeInsets.only(top: 25),
                      child: Text("There is ${lengthoflist.toString()} person",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    )
                    
            ],
          )),
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
