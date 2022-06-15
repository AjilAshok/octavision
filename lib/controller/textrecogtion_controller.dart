import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:octavision/speack.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../main.dart';

class Textrecoginsecontroler extends GetxController {
  late final CameraController controller;
  // late Future<void> initializeControllerFuture;
  final textvoice = Voicespeeech();
  String textspeech = "Text recognition";
  String result='';
  // bool canProcess = true;
  // bool _isBusy = false;
  // CustomPaint? _customPaint;
  // String? _text;
  // String results='';

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    initializeCamera();
    
      (WidgetsBinding.instance).addObserver;

    // scanQR();
    // textvoice.speack(textspeech);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
     (WidgetsBinding.instance).removeObserver;
    
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
     
      controller.initialize();
    
      update();
      
    } on CameraException   catch (e) {
      

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
      // await initializeControllerFuture;

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
  

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    // if (!mounted) return;

    // setState(() {
      // result = barcodeScanRes;
      // laughurls(result);
      // update();
    // });
  }
   laughurls(String url) async {
    // var url=Uri.parse(url);
    if (await canLaunchUrlString(url)) {
     await launchUrlString(url);
    } else {
      throw 'Not find';
    }
  }

