import 'package:flutter_tts/flutter_tts.dart';

class Voicespeeech{
   final FlutterTts speackvoice=FlutterTts();
  
  

  
   
 

  speack(String speechvoice)async{
   print(await speackvoice.getVoices);
     await speackvoice.setLanguage("en-US");
    // await voicetest.setVoice({"name": "en-gb-x-gba-local", "locale": "en-GB"});
    await speackvoice.setPitch(1);
    await speackvoice.setSpeechRate(0.3);
    await speackvoice.speak(speechvoice);
  }

}