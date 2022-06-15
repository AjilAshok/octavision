import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:google_ml_kit/google_ml_kit.dart';

class Languageidentificationcontoller extends GetxController {
  List<IdentifiedLanguage> _identifiedLanguages = <IdentifiedLanguage>[];
  // final TextEditingController controller = TextEditingController();
  final languageIdentifier = LanguageIdentifier(confidenceThreshold: 0.5);
  var identifiedLanguage = '';

  Map<dynamic, String> langelist = {
    "af": "Afrikaans",
    "ar": "Arabic",
    "be": "Belarusian",
    "bg": "Bulgarian",
    "bn": "Bengali",
    "ca": "Catalan",
    "cs": "Czech",
    "cy": "Welsh",
    "da": "Danish",
    "de": "German",
    "el": "Greek",
    "en": "English",
    "eo": "Esperanto",
    "es": "Spanish",
    "et": "Estonian",
    "fa": "Persian",
    "fi": "Finnish",
    "fr": "French",
    "ga": "Irish",
    "gl": "Galician",
    "gu": "Gujarati",
    "he": "Hebrew",
    "hi": "Hindi",
    "hr": "Croatian",
    "ht": "Haitain",
    "hu": "Hungarian",
    "id": "Indonesian",
    "is": "Icelandic",
    "it": "Italian",
    "ja": "Japanese",
    "ka": "Georgian",
    "kn": "Kannada",
    "ko": "Korean",
    "lt": "Lithuanian",
    "lv": "Latvian",
    "mk": "Macedonian",
    "mr": "Marathi",
    "ms": "Malay",
    "mt": "Maltese",
    "nl": "Dutch",
    "no": "Norwegian",
    "pl": "Polish",
    "pt": "Portuguese",
    "ro": "Romanian",
    "ru": "Russian",
    "sk": "Slovak",
    "sl": "Slovenian",
    "sq": "Albanian",
    "sv": "Swedish",
    "sw": "Swahili",
    "ta": "Tamil",
    "te": "Telugu",
    "th": "Thai",
    "tl": "Tagalog",
    "tr": "Turkish",
    "uk": "Ukrainian",
    "ur": "Urdu",
    "vi": "Vietnamese",
    "zh": "Chinese",
    "und": "Language cannot find",
  };
  Future<void> identifyLanguage(TextEditingController controller) async {
    if (controller.text == '') return;
    String language;
    try {
      language = await languageIdentifier.identifyLanguage(controller.text);
    } on PlatformException catch (pe) {
      if (pe.code == languageIdentifier.undeterminedLanguageCode) {
        language = 'error: no language identified!';
      }
      language = 'error: ${pe.details}: ${pe.message}';
      // update();

    } catch (e) {
      language = 'error: ${e.toString()}';
      // update();

    }
    // setState(() {
    var name;

    name = langelist[language];
    name == null
        ? identifiedLanguage = "Not founded"
        : identifiedLanguage = name.toString();
    update();
    // });
  }
}
