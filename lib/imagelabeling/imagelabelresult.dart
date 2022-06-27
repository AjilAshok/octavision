import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:octavision/controller/imagelabelcontroler.dart';

class Imagelabelresult extends StatelessWidget {
  final String imagePath;

   Imagelabelresult({Key? key, required this.imagePath}) : super(key: key);

  final imagelablectrl=Get.put(Imagelabelcontrole());
  late final String _imagePath;
  final imageLabeler = GoogleMlKit.vision.imageLabeler();
  Size? _imageSize;
  List<String> imagesData = [];
  List<String> indexData = [];
  List<String> confidenceData = [];

// Fetching the image size from the image file
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
    // });
    imagelablectrl.update();
  }

  void _recognizeImage() async {
    _getImageSize(File(_imagePath));
    final inputImage = InputImage.fromFilePath(_imagePath);
    final List<ImageLabel> labels = await imageLabeler.processImage(inputImage);
    print("################################################3");
    print(labels);

    for (ImageLabel label in labels) {
      final String item = label.label;
      final int index = label.index;
      final double confidence = label.confidence;
      // setState(() {
        imagesData.add(item);
        indexData.add(index.toString());
        confidenceData.add(confidence.toString());
        print(imagesData);
      // });
      imagelablectrl.update();
    }
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Image Details"),
      ),
      body: GetBuilder<Imagelabelcontrole>(
        initState:(state) {
           _imagePath = imagePath;

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
                                "IdentifiedItems",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              height: 120,
                              child: SingleChildScrollView(
                                child: imagesData != null
                                    ? ListView.builder(
                                        shrinkWrap: true,
                                        physics: BouncingScrollPhysics(),
                                        itemCount: imagesData.length,
                                        itemBuilder: (context, index) {
                                          return Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(imagesData[index]),
                                              // Text(indexData[index]),
                                              Text(confidenceData[index])
                                            ],
                                          );
                                        })
                                    : Container(),
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
