import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;


class Speechtextcontrole extends GetxController{
   bool isListen = false;
   final stt.SpeechToText speech = stt.SpeechToText();


  
  @override
  void onInit()async {
    // TODO: implement onInit
    super.onInit();
    
    isListen = await speech.initialize();
    // setState(() {});
    update();
  
  }

}