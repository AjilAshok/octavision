import 'package:camera/camera.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:octavision/speack.dart';

import '../main.dart';

class Textrecoginsecontroler extends GetxController {
  late final CameraController controller;
   late Future<void> initializeControllerFuture;
  final textvoice = Voicespeeech();
  String textspeech = "Text recognition";
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    initializeCamera();
    // textvoice.speack(textspeech);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
    textvoice.speackvoice.stop();
  }

  void initializeCamera() async {
    try {
      final CameraController cameraController = CameraController(
        cameras[0],
        ResolutionPreset.medium,
      );

      controller = cameraController;
      update();
      initializeControllerFuture= controller.initialize().then((value){
        update();
      });

      // controller.initialize().then((_) {
      //   // if () {
      //   update();
      //   return;

      //   // }

      //   // controller.initialize();
      // });
    } catch (e) {
      print("33333333333333333333");
      print(e);
      update();
    }
  }
  

  Future<String?> takePicture() async {
    if (!controller.value.isInitialized) {
      print("Controller is not initialized");
      update();
      return null;
    }

    String? imagePath;

    if (controller.value.isTakingPicture) {
      print("Processing is progress ...");
      update();
      return null;
    }

    try {
      // Turning off the camera flash
      controller.setFlashMode(FlashMode.off);
      await initializeControllerFuture;

      // Returns the image in cross-platform file abstraction
      final XFile file = await controller.takePicture();

      // Retrieving the path
      imagePath = file.path;
    } on CameraException catch (e) {
      print("Camera Exception: $e");
      update();
      return null;
    }
    update();

    return imagePath;
  }
}
