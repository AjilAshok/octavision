import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:octavision/controller/textrecogtion_controller.dart';
import 'package:octavision/main.dart';
import 'package:octavision/speack.dart';
import 'package:octavision/spinneranimation.dart';
// import 'package:octavision/main.dart';
// import 'package:octavision/speack.dart';
import 'package:octavision/textrecognise/textresult.dart';

class TextCam extends StatelessWidget {
  TextCam({Key? key,}) : super(key: key, );


//   @override
//   State<TextCam> createState() => _CameraviewState();
// }

// class _CameraviewState extends State<TextCam> {
  final textvoice = Voicespeeech();
  String textspeech = "Read Text";
  // late final CameraController _controller;
  // void _initializeCamera() async {
  //    try {
  //     final CameraController cameraController = CameraController(
        
  //       cameras[0],
  //       ResolutionPreset.medium,
  //     );

  //     _controller = cameraController;
  //     // update();
     
  //     _controller.initialize().then((value) {
  //       return;
  //     });
    
  //     // update();
      
  //   } on CameraException   catch (e) {
      

  //     print("33333333333333333333");
  //     print(e);
  //     // update();
  //   }
  // }


  final textrecginisecontoler = Get.put(Textrecoginsecontroler());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text("Read"),
      ),
      body: GetBuilder<Textrecoginsecontroler>(
        dispose: (state) {
          textvoice.speackvoice.stop();
          //  textrecginisecontoler.controller.dispose();
        },
        initState: (state) {

          // _initializeCamera();
          textrecginisecontoler.startLiveFeed();
          // textrecginisecontoler.controller.initialize();
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
                    color: Colors.black,
                    child:const Center(
                      child:Spinner_lodading() ,
                    ),
                  ),
            // ),
          );
        },
      ),
    );
  }
  // Future<String?> takePicture() async {
  //   if (!_controller.value.isInitialized) {
  //     print("Controller is not initialized");
  //     // update();
  //     return null;
  //   }

  //   String? imagePath;

  //   if (_controller.value.isTakingPicture) {
  //     print("Processing is progress ...");
  //     // update();
  //     return null;
  //   }

  //   try {
  //     // Turning off the camera flash
  //     _controller.setFlashMode(FlashMode.off);
  //     // await initializeControllerFuture;

  //     // Returns the image in cross-platform file abstraction
  //     final XFile file = await _controller.takePicture();

  //     // Retrieving the path
  //     imagePath = file.path;
  //   } on CameraException catch (e) {
  //     print("Camera Exception: $e");
  //     // update();
  //     return null;
  //   }
  //   // update();

  //   return imagePath;
  // }
}
