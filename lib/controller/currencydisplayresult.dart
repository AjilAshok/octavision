import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:tflite/tflite.dart';

class Currencydisplayresult extends GetxController{
  


  loadModel() async {
    await Tflite.loadModel(
        model:"assets/model1.tflite", labels:"assets/labels.txt");
  }
  @override
  void onInit() {
    super.onInit();
    loadModel();
  }
  @override
  void dispose() {
    super.dispose();
    Tflite.close();
  }
}