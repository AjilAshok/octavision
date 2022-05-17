// import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/widgets.dart';
// // import 'package:speech_to_text/speech_to_text.dart' as sst;

// class Speech extends StatefulWidget {
//   const Speech({Key? key}) : super(key: key);


//   @override
//   State<Speech> createState() => _SpeechState();
// }

// class _SpeechState extends State<Speech> {
//   bool listen=false;
//   String text="Press button to speak";
//   sst.SpeechToText? _speechToText;
//   @override
//   void initState() {
//     // TODO: implement initState
//     _speechToText=sst.SpeechToText();
//     super.initState();
//   }
  
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text("Speech To Text"),

//           elevation: 0,
//           backgroundColor: Colors.black,
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: Column(
//             children: [
//               Text(text,style: TextStyle(fontSize: 25),)
//             ],

//           ),
//         ),
//         floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//         floatingActionButton: FloatingActionButton(onPressed:listeee,
//         child: Icon(listen?Icons.mic:Icons.mic_none),
//       ),
//     ));
    
//   }
//   void listeee()async{
//     if(!listen){
//       bool available=  await _speechToText!.initialize(
//         onStatus: (val)=> print(val),
//         onError: (va)=>print(va)

//       );
//       if(available){
//         setState(() {
//           listen=true;
//         });
//         _speechToText!.listen(
//           onResult: (value)=>setState(() {
//             text=value.recognizedWords;
            
//           })
//         );

//       }

//     }else{
//       setState(() {
//         listen=false;
//         _speechToText!.stop();
//       });
//     }
//   }
// }