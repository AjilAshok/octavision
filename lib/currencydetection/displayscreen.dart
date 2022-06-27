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


  List op=[];
  int total=0;
  Image? img;
  final style = const TextStyle(
    color: Colors.white,
  );
  
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


  
}
