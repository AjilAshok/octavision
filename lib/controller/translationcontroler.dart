import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:google_ml_kit/google_ml_kit.dart';

class Translationmodelcontroler extends GetxController{
   dynamic index = 0;
  dynamic targeindex = 0;
   String? langaue;

  String dropvalue = "English";

  String dropvalue1 = "Afrikaans";
  final drop = TranslateLanguage.values;
  final drop1 = TranslateLanguage.values;
  // _onDeviceTranslator=
   late final _onDeviceTranslator = OnDeviceTranslator(
      sourceLanguage: drop[index], targetLanguage: drop1[targeindex]);


  Future<void> translateText( text ) async {
    // FocusScope.of(context).unfocus();

    final result = await OnDeviceTranslator(
            sourceLanguage: drop[index], targetLanguage: drop1[targeindex])
        .translateText(text);
    // final result =  _onDeviceTranslator.translateText(_controller.text);
    
      langaue = result;
      update();
    
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _onDeviceTranslator.close();
    
  }
}