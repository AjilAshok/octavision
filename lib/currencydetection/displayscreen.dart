import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:octavision/controller/currencydisplayresult.dart';
import 'package:tflite/tflite.dart';

class Displayscreen extends StatelessWidget {
  final String imagepath;
   Displayscreen({Key? key, required this.imagepath}) : super(key: key);

//   @override
//   State<Displayscreen> createState() => _DisplayscreenState();
// }

// class _DisplayscreenState extends State<Displayscreen> {
  List op=[];
  int total=0;
  Image? img;
  final style = const TextStyle(
    color: Colors.white,
  );
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   loadModel().then((value) {
  //     setState(() {});
  //   });
  //   img =Image.file(File(widget.imagepath));
  //   classifyImage(widget.imagepath);
  // }
  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   super.dispose();
  //   Tflite.close();
  // }
  final currencycontroler=Get.put(Currencydisplayresult());

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
      body: GetBuilder<Currencydisplayresult>(
        initState:(state) {
           img =Image.file(File(imagepath));
           classifyImage(imagepath);

          
        }, 
        builder: (controller) => 
         Column(
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
      ),
    ));
  }
  classifyImage(String image) async {
    var output = await Tflite.
    // detectObjectOnImage(path: image,
    // model: "YOLO",
    // imageMean:0.0,
    // imageStd: 255.5,
    // threshold: 0.3,
    // numResultsPerClass: 2,
    // asynch: true 
    // );
    runModelOnImage(
      path: image,
      // numResults: 5,
      threshold: .5,
      imageMean:0.0,
      imageStd: 225.0,
      asynch: true
    );
    // setState(() {
       op.add(output);
       currencycontroler.update();
      
    // });

   
    print("&&&&&&&&&&&&&&&&&&&&");
    print(op);

    
  }


  // loadModel() async {
  //   await Tflite.loadModel(
  //       model: "assets/model_unquant.tflite", labels: "assets/labels.txt");
  // }
}
