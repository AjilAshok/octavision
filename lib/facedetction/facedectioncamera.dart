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

//   @override
//   State<Facedetction_camera> createState() => _CameraviewState();
// }

// class _CameraviewState extends State<Facedetction_camera> {
  final facevoice = Voicespeeech();
  String facespeech = 'Face detection';
  // late final CameraController _controller;
  final facedectioncontroler = Get.put(Textrecoginsecontroler());
  // void _initializeCamera() async {
  //   try {
  //     final CameraController cameraController = CameraController(
  //     cameras[0],
  //     ResolutionPreset.high,
  //   );
  //   _controller = cameraController;

  //   _controller.initialize().then((_) {
  //     if (!mounted) {
  //       return;
  //     }
  //     setState(() {});
  //   });
  //   } catch (e) {

  //     print(e);
  //   }

  // }
  //  Future<String?> _takePicture() async {
  //   if (!_controller.value.isInitialized) {
  //     print("Controller is not initialized");
  //     return null;
  //   }

  //   String? imagePath;

  //   if (_controller.value.isTakingPicture) {
  //     print("Processing is progress ...");
  //     return null;
  //   }

  //   try {

  //     // Turning off the camera flash
  //     _controller.setFlashMode(FlashMode.off);

  //     // Returns the image in cross-platform file abstraction
  //     final XFile file = await _controller.takePicture();

  //     // Retrieving the path
  //     imagePath = file.path;
  //   } on CameraException catch (e) {
  //     print("Camera Exception: $e");
  //     return null;
  //   }

  //   return imagePath;
  // }
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   // _initializeCamera();
  //   // facevoice.speack(facespeech);
  //   super.initState();
  // }
  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   super.dispose();
  //   // _controller.dispose();
  //   // facevoice.speackvoice.stop();
  // }
  // @override
  // void didChangeAppLifecycleState(AppLifecycleState state) {
  //   // App state changed before we got the chance to initialize.
  //   if (_controller == null || !_controller.value.isInitialized) {
  //     return;
  //   }
  //   if (state == AppLifecycleState.inactive) {
  //     _controller.dispose();
  //   } else if (state == AppLifecycleState.resumed) {
  //     if (_controller != null) {
  //       // onNewCameraSelected(_controller.description);
  //     }
  //   }
  // }
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
                    // Padding(
                    //   padding: const EdgeInsets.all(20.0),
                    //   child: Container(
                    //     alignment: Alignment.bottomCenter,
                    //     child: ElevatedButton.icon(
                    //       style: ButtonStyle(backgroundColor:MaterialStateProperty.all(Colors.black)),
                    //       icon: Icon(Icons.camera,color: Colors.white,),
                    //       label: Text("Click"),
                    //       onPressed: () async {

                    //         // If the returned path is not null navigate
                    //         // to the DetailScreen
                    //         await _takePicture().then((String? path) {
                    //           if (path != null) {
                    //             Navigator.push(
                    //               context,
                    //               MaterialPageRoute(
                    //                 builder: (context) => Facedection(
                    //                   imagePath: path,
                    //                 ),
                    //               ),
                    //             );
                    //           } else {
                    //             print('Image path not found!');
                    //           }
                    //         });
                    //       },
                    //     ),
                    //   ),
                    // )
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
