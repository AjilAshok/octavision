import 'package:camera/camera.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:octavision/speack.dart';

import '../main.dart';

class Textrecoginsecontroler extends  GetxController{
  late final CameraController controller;
   final textvoice=Voicespeeech();
  String textspeech="Text recognition";
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _initializeCamera();
    textvoice.speack(textspeech);
  }




   void _initializeCamera() async {
    final CameraController cameraController = CameraController(
      cameras[0],
      ResolutionPreset.high,
    );
    controller = cameraController;
  
    controller.initialize().then((_) {
      // if (!mounted) {
      //   return;
      // }
      update();
    });
  }
  Future<String?> takePicture(  ) async {
    if (!controller.value.isInitialized) {
      print("Controller is not initialized");
      return null;
    }

    String? imagePath;

    if (controller.value.isTakingPicture) {
      print("Processing is progress ...");
      return null;
    }

    try {
      // Turning off the camera flash
      controller.setFlashMode(FlashMode.off);

      // Returns the image in cross-platform file abstraction
      final XFile file = await controller.takePicture();

      // Retrieving the path
      imagePath = file.path;
    } on CameraException catch (e) {
      print("Camera Exception: $e");
      return null;
    }

    return imagePath;
  }
  
}