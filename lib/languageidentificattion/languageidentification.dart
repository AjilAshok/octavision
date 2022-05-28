import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_ml_kit/google_ml_kit.dart';

class LanguageIdentifierView extends StatefulWidget {
  @override
  _LanguageIdentifierViewState createState() => _LanguageIdentifierViewState();
}

class _LanguageIdentifierViewState extends State<LanguageIdentifierView> {
 Map<dynamic,String> langelist={
   "af":"Afrikaans",
"ar":"Arabic",
"be":"Belarusian",
"bg":"Bulgarian",
"bn":"Bengali",
"ca":"Catalan",
"cs":"Czech",
"cy":"Welsh",
"da":"Danish",
"de":"German",
"el":"Greek",
"en":"English",
"eo":"Esperanto",
"es":"Spanish",
"et":"Estonian",
"fa":"Persian",
"fi":"Finnish",
"fr":"French",
"ga":"Irish",
"gl":"Galician",
"gu":"Gujarati",
"he":"Hebrew",
"hi":"Hindi",
"hr":"Croatian",
"ht":"Haitain",
"hu":"Hungarian",
"id":"Indonesian",
"is":"Icelandic",
"it":"Italian",
"ja":"Japanese",
"ka":"Georgian",
"kn":"Kannada",
"ko":"Korean",
"lt":"Lithuanian",
"lv":"Latvian",
"mk":"Macedonian",
"mr":"Marathi",
"ms":"Malay",
"mt":"Maltese",
"nl":"Dutch",
"no":"Norwegian",
"pl":"Polish",
"pt":"Portuguese",
"ro":"Romanian",
"ru":"Russian",
"sk":"Slovak",
"sl":"Slovenian",
"sq":"Albanian",
"sv":"Swedish",
"sw":"Swahili",
"ta":"Tamil",
"te":"Telugu",
"th":"Thai",
"tl":"Tagalog",
"tr":"Turkish",
"uk":"Ukrainian",
"ur":"Urdu",
"vi":"Vietnamese",
"zh":"Chinese",
"und":"Language cannot find",


 };
  List<IdentifiedLanguage> _identifiedLanguages = <IdentifiedLanguage>[];
  final TextEditingController _controller = TextEditingController();
  final _languageIdentifier = LanguageIdentifier(confidenceThreshold: 0.5);
  var _identifiedLanguage = '';

  @override
  void dispose() {
    _languageIdentifier.close();
    super.dispose();
  }

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
            controller: _controller,
          ),
        ),
        SizedBox(height: 15),
        _identifiedLanguage == ''
            ? Container()
            : Container(
                margin: EdgeInsets.only(bottom: 5),
                child: Text(
                  'Identified Language: $_identifiedLanguage',
                  style: TextStyle(fontSize: 20),
                )),
        ElevatedButton(
            onPressed: _identifyLanguage,
            child: const Text('Identify Language')),
        // SizedBox(height: 15),
        // ElevatedButton(
        //   child: const Text('Identify possible languages'),
        //   onPressed: _identifyPossibleLanguages,
        // ),
        ListView.builder(
            shrinkWrap: true,
            itemCount: _identifiedLanguages.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                    'Language: ${_identifiedLanguages[index].languageTag}  Confidence: ${_identifiedLanguages[index].confidence.toString()}'),
              );
            })
      ]),
    );
  }

  Future<void> _identifyLanguage() async {
    // _controller.text;
    // String langaue;
    // langaue =await _languageIdentifier.identifyLanguage(_controller.text);
    // print("#########3");
    // print(langaue);
    // var name=langelist[langaue];
    // print(name);
    // setState(() {
    //   _identifiedLanguage=name.toString();
    // });

    if (_controller.text == '') return;
    String language;
    try {
      language = await _languageIdentifier.identifyLanguage(_controller.text);
    } on PlatformException catch (pe) {
      if (pe.code == _languageIdentifier.undeterminedLanguageCode) {
        language = 'error: no language identified!';
      }
      language = 'error: ${pe.details}: ${pe.message}';
      
    } catch (e) {
      
     
      language = 'error: ${e.toString()}';
      
    }
    setState(() {
      var name;
    
      name=langelist[language];
      name==null?_identifiedLanguage="Not founded":
    
    
      _identifiedLanguage = name.toString();
    });
  }

  Future<void> _identifyPossibleLanguages() async {
    if (_controller.text == '') return;
    String error;
    try {
      final possibleLanguages =
          await _languageIdentifier.identifyPossibleLanguages(_controller.text);
      setState(() {
        _identifiedLanguages = possibleLanguages;
      });
      return;
    } on PlatformException catch (pe) {
      if (pe.code == _languageIdentifier.undeterminedLanguageCode) {
        error = 'error: no languages identified!';
      }
      error = 'error: ${pe.code}: ${pe.message}';
    } catch (e) {
      error = 'error: ${e.toString()}';
    }
    setState(() {
      _identifiedLanguages = [];
      _identifiedLanguage = error;
    });
  }
}