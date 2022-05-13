import 'dart:async';

import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Barcode_scanner extends StatefulWidget {
  final String imagePath;
  const Barcode_scanner({Key? key, required this.imagePath}) : super(key: key);

  @override
  State<Barcode_scanner> createState() => _Barcode_scannerState();
}

class _Barcode_scannerState extends State<Barcode_scanner> {
  late final String _imagePath;
  final barcodeScanner = GoogleMlKit.vision.barcodeScanner();

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
    setState(() {
      _imageSize = imageSize;
    });
  }

  void _recognizeImage() async {
    _getImageSize(File(_imagePath));
    final inputImage = InputImage.fromFilePath(_imagePath);
    final List<Barcode> barcodes =
        await barcodeScanner.processImage(inputImage);

    print("@#\$%^%\$#@@#\$%^");
    print(barcodes);

    for (Barcode barco in barcodes) {
      final String barcod = barco.displayValue.toString();
      // final int index = label.index;DetailScreenDetailScreen
      // final double confidence = label.confidence;
      setState(() {
        // imagesData.add(item);
        // indexData.add(index.toString());
        barcoderesult = barcod;
        print(barcod);
      });
    }
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
    barcodeScanner.close();
    super.dispose();
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
                              "Barcode Result",
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
                               barcoderesult.isNotEmpty? 
                              //  laughurls(barcoderesult):const Text("No Result Please try again"),
                                   RichText(
                                      text: TextSpan(children: [
                                      TextSpan(
                                          text: barcoderesult,
                                          style: TextStyle(color: Colors.red),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () async {
                                              var url=Uri.parse(barcoderesult);
                                              // var url = barcoderesult;
                                              // laughurl(url);
                                              if (await canLaunchUrl(
                                                  url)) {
                                                await launchUrl (url);
                                              } else {
                                                throw 'Not find';
                                              }
                                            })
                                    ]))
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
    );
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
