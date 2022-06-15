import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
// import 'package:get/get_state_manager/src/simple/get_state.dart';
// import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:octavision/controller/languageidentficationcontroller.dart';

class LanguageIdentifierView extends StatelessWidget {


  // List<IdentifiedLanguage> _identifiedLanguages = <IdentifiedLanguage>[];
  final TextEditingController controller = TextEditingController();
  // final languageIdentifier = LanguageIdentifier(confidenceThreshold: 0.5);
  // var identifiedLanguage = '';

 
  final languaguecontrol=Get.put(Languageidentificationcontoller());
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        title: Text('Language Identification')),
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
        // SizedBox(height: 15),
        // ElevatedButton(
        //   child: const Text('Identify possible languages'),
        //   onPressed: _identifyPossibleLanguages,
        // ),
        // ListView.builder(
        //     shrinkWrap: true,
        //     itemCount: _identifiedLanguages.length,
        //     itemBuilder: (context, index) {
        //       return ListTile(
        //         title: Text(
        //             'Language: ${_identifiedLanguages[index].languageTag}  Confidence: ${_identifiedLanguages[index].confidence.toString()}'),
        //       );
        //     })
      ]),
    );
  }

  // Future<void> identifyLanguage() async {
  

  //   if (controller.text == '') return;
  //   String language;
  //   try {
  //     language = await languageIdentifier.identifyLanguage(controller.text);
  //   } on PlatformException catch (pe) {
  //     if (pe.code == languageIdentifier.undeterminedLanguageCode) {
  //       language = 'error: no language identified!';
  //     }
  //     language = 'error: ${pe.details}: ${pe.message}';
      
  //   } catch (e) {
      
     
  //     language = 'error: ${e.toString()}';
      
  //   }
  //   setState(() {
  //     var name;
    
  //     name=langelist[language];
  //     name==null?identifiedLanguage="Not founded":
    
    
  //     identifiedLanguage = name.toString();
  //   });
  // }

  // Future<void> _identifyPossibleLanguages() async {
  //   if (_controller.text == '') return;
  //   String error;
  //   try {
  //     final possibleLanguages =
  //         await _languageIdentifier.identifyPossibleLanguages(_controller.text);
  //     setState(() {
  //       _identifiedLanguages = possibleLanguages;
  //     });
  //     return;
  //   } on PlatformException catch (pe) {
  //     if (pe.code == _languageIdentifier.undeterminedLanguageCode) {
  //       error = 'error: no languages identified!';
  //     }
  //     error = 'error: ${pe.code}: ${pe.message}';
  //   } catch (e) {
  //     error = 'error: ${e.toString()}';
  //   }
  //   setState(() {
  //     _identifiedLanguages = [];
  //     _identifiedLanguage = error;
  //   });
  // }
}