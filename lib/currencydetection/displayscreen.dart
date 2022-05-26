import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:tflite/tflite.dart';

class Displayscreen extends StatefulWidget {
  final String imagepath;
  const Displayscreen({Key? key, required this.imagepath}) : super(key: key);

  @override
  State<Displayscreen> createState() => _DisplayscreenState();
}

class _DisplayscreenState extends State<Displayscreen> {
  List op=[];
  int total=0;
  Image? img;
  final style = const TextStyle(
    color: Colors.white,
  );
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadModel().then((value) {
      setState(() {});
    });
    img =Image.file(File(widget.imagepath));
    classifyImage(widget.imagepath);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    Tflite.close();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Currency Detection",
          style: style,
        ),
      ),
      body: Column(
        children: [
          Center(
            child: img,
          ),
          Expanded(
            child: SizedBox(
              height: 150,
              width: double.infinity,
              child: Card(
                child: Text(op.toString()),
              ),
            ),
          )
        ],
      ),
    ));
  }
  classifyImage(String image) async {
    var output = await Tflite.runModelOnImage(
      path: image,
      numResults: 5,
      threshold: .5,
      imageMean: 127.5,
      imageStd: 127.5,
      asynch: true
    );
    setState(() {
       op.add(output);
      
    });

   
    print("&&&&&&&&&&&&&&&&&&&&");
    print(op);

    // if (op != null) {
    //   if (op[0]["label"] == "50 rupees") {
    //     total += 50;
    //     print(total);
    //     // runTextToSpeech("50 rupees", total);
    //   }
    //   if (op[0]["label"] == "100 rupees") {
    //     total += 100;
    //     // runTextToSpeech("100 rupees", total);
    //   }
    //   if (op[0]["label"] == "200 rupees") {
    //     total += 200;
    //     // runTextToSpeech("200 rupees", total);
    //   }
    //   if (op[0]["label"] == "500 rupees") {
    //     total += 500;
    //     // runTextToSpeech("500 rupees", total);
    //   }

    //   if (op[0]["label"] == "2000 rupees") {
    //     total += 2000;
    //     // runTextToSpeech("2000 rupees", total);
    //   }
    // } 
      // runTextToSpeech("No note found", total);
  }


  loadModel() async {
    await Tflite.loadModel(
        model: "assets/model_unquant.tflite", labels: "assets/labels.txt");
  }
}
