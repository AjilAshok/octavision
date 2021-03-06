import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octavision/controller/speechtotextcontroler.dart';
import 'package:octavision/objectdetection/objectdetectioncam.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class SpeechToText extends StatelessWidget {
  SpeechToText({Key? key}) : super(key: key);

//   @override
//   State<SpeechToText> createState() => _SpeechToTextState();
// }

// class _SpeechToTextState extends State<SpeechToText> {
  final contoler = Get.put(Speechtextcontrole());
  List<String> itemss = [
    'chair',
    'bed',
    'table',
    'couch',
    'refrigerator',
    'TV',
    'sink'
  ];
  // Map<String, List> itemss = {
  //   'chair': ['sit', 'chair'],
  //   'bed': ['bed', 'rest', 'sleep'],
  //   'table': [ 'table','dinning',],
  //   'sink': ['wash', 'wash basin', 'basin'],
  //   'laptop': ['laptop', 'computer'],
  //   'keyboard': ['keyboard'],
  //   'mobile': ['mobile', 'phone', 'mobile phone'],
  //   'tv': ['tv', 'television'],
  //   'refrigerator': ['refrigerator', 'fridge'],
  //   'AC': ['air conditioner', 'ac']
  // };
  bool? res = false;
  stt.SpeechToText _speech = stt.SpeechToText();
  bool _isListen = false;
  String displaytext = "What you want to find";
  void _startListening() async {
    await _speech.listen(
        listenMode: stt.ListenMode.confirmation,
        sampleRate: 100,
        listenFor: const Duration(minutes: 60),
        pauseFor: const Duration(minutes: 60),
        onResult: _onSpeechResult);
    contoler.update();
  }

  void _onSpeechResult(
    SpeechRecognitionResult result,
  ) {
    displaytext = result.recognizedWords;
    contoler.update();
    var arr = displaytext.split(' ');
    
    for (var i = 0; i < itemss.length; i++) {
      for (var j = 0; j< arr.length; j++) {
        if (itemss[i]==arr[j]) {
          print(itemss[i]);
          Get.to(ObjectDetectorView(outputvoice:itemss[i],));

        }

        

      }
      

    }


    contoler.update();
   
  }

  void _stopListening() async {
    await _speech.stop();
    contoler.update();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          "Talk",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: GetBuilder<Speechtextcontrole>(
        builder: (controller) => AvatarGlow(
          animate: _speech.isListening,
          glowColor: Colors.red,
          duration: Duration(milliseconds: 2000),
          repeatPauseDuration: Duration(milliseconds: 100),
          repeat: true,
          endRadius: 80,
          child: FloatingActionButton(
            onPressed: () {
              _speech.isNotListening ? _startListening() : _stopListening();
            },
            child: Icon(
              _speech.isNotListening ? Icons.mic : Icons.mic_none,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: GetBuilder<Speechtextcontrole>(
        builder: (controller) => SingleChildScrollView(
          reverse: true,
          child: Container(
            padding: const EdgeInsets.all(50),
            child: Text(displaytext,
                overflow: TextOverflow.clip,
                style: GoogleFonts.oregano(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                    fontSize: 25)),
          ),
        ),
      ),
    ));
  }
}
