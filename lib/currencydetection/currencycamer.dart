import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:octavision/controller/textrecogtion_controller.dart';
import 'package:octavision/currencydetection/displayscreen.dart';
import 'package:octavision/facedetction/facedectionresult.dart';
import 'package:octavision/main.dart';
import 'package:octavision/speack.dart';
import 'package:octavision/spinneranimation.dart';

class Currencydection extends StatelessWidget {
   Currencydection({ Key? key }) : super(key: key);
  final currcenyvoice=Voicespeeech();
  String facespeech='Currency ';
  final currencyControler=Get.put(Textrecoginsecontroler());
  
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text("Currency "),),
      body: GetBuilder<Textrecoginsecontroler>(
        initState:(state) {
           currencyControler.startLiveFeed();
          currcenyvoice.speack(facespeech);
          
        }, 
        builder: (controllers) => 
        controllers.controller.value.isInitialized
            ? GestureDetector(
              onTap: ()async{
                await controllers.takePicture().then((String? path) {
                              if (path != null) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Displayscreen(
                                      imagepath: path,
                                    ),
                                  ),
                                );
                              } else {
                                print('Image path not found!');
                              }
                            });
      
              },
              child: Stack(
                fit: StackFit.expand,
                  children: [
                    CameraPreview(controllers.controller),
                  ],
                ),
            )
            :const Spinner_lodading()
      ),
    );
  }
      
    
  
  

}