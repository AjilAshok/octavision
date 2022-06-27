import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:octavision/controller/textrecogtion_controller.dart';
import 'package:octavision/facedetction/facedectionresult.dart';
import 'package:octavision/main.dart';
import 'package:octavision/speack.dart';

class Facedetction_camera extends StatelessWidget {
  Facedetction_camera({
    Key? key,
  }) : super(key: key);


  final facevoice = Voicespeeech();
  String facespeech = 'Face detection';
  
  final facedectioncontroler = Get.put(Textrecoginsecontroler());
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Face Detection"),
      ),
      body: GetBuilder<Textrecoginsecontroler>(
        dispose: (state) {
          facevoice.speackvoice.stop();
        },
        initState: (state) {
          facedectioncontroler.controller.initialize();

          facevoice.speack(facespeech);
        },
        builder: (controllers) => GestureDetector(
          onTap: () async {
            await controllers.takePicture().then((String? path) {
              if (path != null) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Facedection(
                      imagePath: path,
                    ),
                  ),
                );
              } else {
                print('Image path not found!');
              }
            });
          },
          child: controllers.controller.value.isInitialized
              ? Stack(
                  fit: StackFit.expand,
                  children: [
                    CameraPreview(controllers.controller),
                  
                  ],
                )
              : Container(
                  color: Colors.black,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
        ),
      ),
    );
  }
}
