import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:tflite/tflite.dart';

class Currencydisplayresult extends GetxController{
  //   classifyImage(String image) async {
  //   var output = await Tflite.runModelOnImage(
  //     path: image,
  //     numResults: 5,
  //     threshold: .5,
  //     imageMean: 127.5,
  //     imageStd: 127.5,
  //     asynch: true
  //   );
  //   update();
  //   // setState(() {
  //   //    op.add(output);
      
  //   // });

   
  //   print("&&&&&&&&&&&&&&&&&&&&");
  //   // print(op);

    
  // }


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