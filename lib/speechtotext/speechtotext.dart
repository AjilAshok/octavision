import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class SpeechToText extends StatefulWidget {
  const SpeechToText({Key? key}) : super(key: key);

  @override
  State<SpeechToText> createState() => _SpeechToTextState();
}

class _SpeechToTextState extends State<SpeechToText> {
  stt.SpeechToText _speech = stt.SpeechToText();
  bool _isListen = false;
  String displaytext = "Press the button to speack";
  void _startListening() async {
    await _speech.listen(
        listenMode: stt.ListenMode.confirmation,
        sampleRate: 100,
        listenFor: const Duration(minutes: 60),
        pauseFor: const Duration(seconds: 240),
        onResult: _onSpeechResult);
    setState(() {});
  }

  initstates() async {
    _isListen = await _speech.initialize();
    setState(() {});
  }

  void _onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      displaytext = result.recognizedWords;
    });
  }

  void _stopListening() async {
    await _speech.stop();
    setState(() {
      //  islisten=false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initstates();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title:const Text("Speech to Text",style: TextStyle(color: Colors.white),),
            backgroundColor: Colors.black,
          ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AvatarGlow(
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
          child: Icon(_speech.isNotListening ? Icons.mic: Icons.mic_none,color: Colors.black,),
        ),
      ),
      body: SingleChildScrollView(
        reverse: true,
        child: Container(
          padding: const EdgeInsets.all(50),
          child: Text(
            displaytext,
            overflow: TextOverflow.clip,
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ),
      ),
    ));
  }
}
