import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_mlkit_translation/google_mlkit_translation.dart';
import 'package:octavision/controller/translationcontroler.dart';
import 'package:octavision/speack.dart';

class Translationmodel extends StatelessWidget {
  Translationmodel({Key? key,required this.text}) : super(key: key);

  var items = [
    "Afrikaans",
    "Albanian",
    "Arabic",
    "Belarusian",
    "Bengali",
    "Bulgarian",
    "Catalan",
    "Chinese",
    "Croatian",
    "Czech",
    "Danish",
    "Dutch",
    "English",
    "Esperanto",
    "Estonian",
    "Finnish",
    "French",
    "Galician",
    "Georgian",
    "German",
    "Greek",
    "Gujarat",
    "Haitian",
    "Hebrew",
    "Hindi",
    "Hungarian",
    "Icelandic",
    "Indonesian",
    "Irish",
    "Italian",
    "Japanese",
    "Kannada",
    "Korean",
    "Latvian",
    "Lithuanian",
    "Macedonian",
    "Malay",
    "Maltese",
    "Marathi",
    "Norwegian",
    "Persian",
    "Polish",
    "Portuguese",
    "Romanian",
    "Russian",
    "Slovak",
    "Slovenian",
    "Spanish",
    "Swahili",
    "Swedish",
    "Tagalog",
    "Tamil",
    "Telugu",
    "Thai",
    "Turkish",
    "Ukrainian",
    "Urdu",
    "Vietnamese",
    "Welsh",
  ];

  // final _controller = TextEditingController();
  final languagvoice = Voicespeeech();
  String languagespechh = "Translation";
   String text ;

  final translatincontroler = Get.put(Translationmodelcontroler());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: const Text("Translation"),
        backgroundColor: Colors.black,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: ListView(
          children: [
            SizedBox(height: 30),
            GetBuilder<Translationmodelcontroler>(
                initState: (state) {
                  languagvoice.speack(languagespechh);
                },
                dispose: (state) {
                  languagvoice.speackvoice.stop();
                },
                builder: (controller) => Center(
                    child:
                        Text('Enter text (source: ${controller.dropvalue})'))),
            // Padding(
            //   padding: const EdgeInsets.all(20.0),
            //   child: GetBuilder<Translationmodelcontroler>(
            //     // initState: (state) {
            //     //   languagvoice.speack(languagespechh);
            //     // },
            //     // dispose: (state) {
            //     //   languagvoice.speackvoice.stop();
            //     // },
            //     builder: (controller) => DropdownButton(
            //         value: controller.dropvalue,
            //         items: items.map((String item) {
            //           return DropdownMenuItem(
            //             value: item,
            //             child: Text(item),
            //           );
            //         }).toList(),
            //         onChanged: (String? newvalues) {
            //           // setState(() {
            //           controller.index = items.indexOf(newvalues.toString());
            //           print(newvalues);

            //           controller.dropvalue = newvalues.toString();
            //           controller.update();
            //           // });
            //         }),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                      border: Border.all(
                    width: 2,
                  )),
                  child: Text(text)
                  // TextField(
                  //   controller: _controller,
                  //   decoration: InputDecoration(border: InputBorder.none),
                  //   maxLines: null,
                  // ),
                  ),
            ),
            GetBuilder<Translationmodelcontroler>(
                builder: (controller) => Center(
                    child: Text(
                        'Translated Text (target: ${controller.dropvalue1})'))),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: GetBuilder<Translationmodelcontroler>(
                builder: (controller) => DropdownButton(
                    value: controller.dropvalue1,
                    items: items.map((String item) {
                      return DropdownMenuItem(
                        value: item,
                        child: Text(
                          item,
                          style: TextStyle(color: Colors.black),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newvalues) {
                      // setState(() {
                      print(newvalues);
                      controller.targeindex =
                          items.indexOf(newvalues.toString());
                      controller.dropvalue1 = newvalues!;
                      controller.update();
                      // });
                    }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                  width: MediaQuery.of(context).size.width / 1.3,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      border: Border.all(
                    width: 2,
                  )),
                  child: GetBuilder<Translationmodelcontroler>(
                      builder: (controller) => Text(controller.langaue ?? ''))),
            ),
            SizedBox(height: 30),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              GetBuilder<Translationmodelcontroler>(
                builder: (controller) => ElevatedButton(
                    onPressed: () {
                      controller.translateText(text);
                    },
                    child: const Text('Translate')),
              )
            ]),
          ],
        ),
      ),
    ));
  }
}
