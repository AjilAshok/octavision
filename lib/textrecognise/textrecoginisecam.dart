import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:octavision/controller/textrecogtion_controller.dart';
import 'package:octavision/main.dart';
import 'package:octavision/speack.dart';
// import 'package:octavision/main.dart';
// import 'package:octavision/speack.dart';
import 'package:octavision/textrecognise/textresult.dart';

class TextCam extends StatelessWidget {
  TextCam({Key? key}) : super(key: key);

//   @override
//   State<TextCam> createState() => _CameraviewState();
// }

// class _CameraviewState extends State<TextCam> {
  final textvoice = Voicespeeech();
  String textspeech = "Text recognization";
  late final CameraController _controller;
  void _initializeCamera() async {
    final CameraController cameraController = CameraController(
      cameras[0],
      ResolutionPreset.high,
    );
    _controller = cameraController;

    _controller.initialize().then((_) {
     
    });
  }


  final textrecginisecontoler = Get.put(Textrecoginsecontroler());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Text Recognition"),
      ),
      body: GetBuilder<Textrecoginsecontroler>(
        dispose: (state) {
          textvoice.speackvoice.stop();
          //  textrecginisecontoler.controller.dispose();
        },
        initState: (state) {
          textrecginisecontoler.controller.initialize();
          textvoice.speack(textspeech);
        },
        builder: (controllers) {
          return GestureDetector(
            onTap: () async {
              await controllers.takePicture().then((String? path) {
                if (path != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TextreconiseResult(
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
                    color: Colors.red,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
            // ),
          );
        },
      ),
    );
  }
}
