import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:google_mlkit_translation/google_mlkit_translation.dart';
import 'package:octavision/speack.dart';

class Translationmodel extends StatefulWidget {
  const Translationmodel({Key? key}) : super(key: key);

  @override
  State<Translationmodel> createState() => _TranslationmodelState();
}

class _TranslationmodelState extends State<Translationmodel> {
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
  String? langaue;
  final _controller = TextEditingController();
  final languagvoice=Voicespeeech();
  String languagespechh="Language Translation";
  dynamic index = 0;
  dynamic targeindex = 0;
  final drop = TranslateLanguage.values;
  final drop1 = TranslateLanguage.values;
  late final _onDeviceTranslator = OnDeviceTranslator(
      sourceLanguage: drop[index], targetLanguage: drop1[targeindex]);

  String dropvalue = "Afrikaans";

  String dropvalue1 = "Afrikaans";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    languagvoice.speack(languagespechh);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    languagvoice.speackvoice.stop();
    _onDeviceTranslator.close();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Language translation "),
        backgroundColor: Colors.black,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: ListView(
          children: [
            SizedBox(height: 30),
            Center(child: Text('Enter text (source: ${dropvalue})')),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: DropdownButton(
                  value: dropvalue,
                  items: items.map((String item) {
                    return DropdownMenuItem(
                      value: item,
                      child: Text(item),
                    );
                  }).toList(),
                  onChanged: (String? newvalues) {
                    setState(() {
                      index = items.indexOf(newvalues.toString());
                      print(newvalues);

                      dropvalue = newvalues.toString();
                    });
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    border: Border.all(
                  width: 2,
                )),
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(border: InputBorder.none),
                  maxLines: null,
                ),
              ),
            ),
            Center(child: Text('Translated Text (target: ${dropvalue1})')),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: DropdownButton(
                  value: dropvalue1,
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
                    setState(() {
                      print(newvalues);
                      targeindex = items.indexOf(newvalues.toString());
                      dropvalue1 = newvalues!;
                    });
                  }),
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
                  child: Text(langaue ?? '')),
            ),
            SizedBox(height: 30),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              ElevatedButton(
                  onPressed: _translateText, child: Text('Translate'))
            ]),
          ],
        ),
      ),
    ));
  }

  Future<void> _translateText() async {
    FocusScope.of(context).unfocus();

    final result = await OnDeviceTranslator(
            sourceLanguage: drop[index], targetLanguage: drop1[targeindex])
        .translateText(_controller.text);
    // final result =  _onDeviceTranslator.translateText(_controller.text);
    setState(() {
      langaue = result;
    });
  }
}
