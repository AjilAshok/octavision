import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:octavision/controller/textrecogtion_controller.dart';

import 'package:octavision/imagelabeling/imagelabelresult.dart';
import 'package:octavision/main.dart';
import 'package:octavision/speack.dart';
import 'package:octavision/spinneranimation.dart';

class Imagelabel_camera extends StatelessWidget {
  Imagelabel_camera({Key? key}) : super(key: key);

  final imagespech = Voicespeeech();
  String imagelablevoice = "See";
  final imagelabelcontroler = Get.put(Textrecoginsecontroler());
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title:const Text("See"),
      ),
      body: GetBuilder<Textrecoginsecontroler>(
        initState: (state) {
          imagelabelcontroler.startLiveFeed();

          imagespech.speack(imagelablevoice);
        },
        builder: (controllers) => GestureDetector(
          onTap: () async {
            await controllers.takePicture().then((String? path) {
              if (path != null) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Imagelabelresult(
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
              :const Spinner_lodading()
        ),
      ),
    );
  }
}
