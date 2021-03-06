import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
// import 'package:get/get_state_manager/src/simple/get_state.dart';
// import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:octavision/controller/languageidentficationcontroller.dart';
import 'package:octavision/speack.dart';

class LanguageIdentifierView extends StatelessWidget {


 
  final TextEditingController controller = TextEditingController();
  

 
  final languaguecontrol=Get.put(Languageidentificationcontoller());
 final voice=Voicespeeech();
 String voicesond="Language";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text('Language ')),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: TextField(
            decoration:const  InputDecoration(
              // labelText: "Enter",
              hintText: "Enter any Language"
            ),
            controller: controller,
          ),
        ),
        SizedBox(height: 15),
        GetBuilder<Languageidentificationcontoller>(
          initState:(state) {
            voice.speack(voicesond);

            
          },
          dispose:(state){
            voice.speackvoice.stop();
          } ,
          builder: (controllers) => 
          controllers.identifiedLanguage == ''
              ? Container()
              : Container(
                  margin: EdgeInsets.only(bottom: 5),
                  child: Text(
                    'Identified Language: ${controllers.identifiedLanguage}',
                    style: TextStyle(fontSize: 20),
                  )),
        ),
        GetBuilder<Languageidentificationcontoller>(
          builder: (controllerla) => 
           ElevatedButton(
              onPressed: (){
                controllerla.identifyLanguage(controller);

                
              },
              child: const Text('Find Language')),
        ),
       
      ]),
    );
  }

  
}