// import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tts/flutter_tts.dart';
// import 'package:octavision/barcode/barcoderesult.dart';
import 'package:octavision/main.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:octavision/speack.dart';
import 'package:url_launcher/url_launcher_string.dart';


      
    
  
  


class Camerabarcode extends StatefulWidget {
  const Camerabarcode({Key? key}) : super(key: key);
  

  @override
  State<Camerabarcode> createState() => _CamerabarcodeState();
}

class _CamerabarcodeState extends State<Camerabarcode> {
  final FlutterTts barcodevoice=FlutterTts();
  final obj= Voicespeeech();
  String barcodespecch="Barcode";
  String result='';

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    
    obj.speackvoice.stop();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    scanQR();
    obj.speack(barcodespecch);
    


  }
  

  
  Future<void> scanQR() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666',"Cancel", false, ScanMode.QR);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      result = barcodeScanRes;
      laughurls(result);
    });
  }
  @override
  Widget build(BuildContext context) {
    // scanQR();
    
    return SafeArea(child: Scaffold(
      appBar:AppBar(
        // leading: ,
        backgroundColor: Colors.black,
        title:const Text("Barcode Scanner"),), 
        
        body:const Center(
          child: CircularProgressIndicator(

          )

        )));
    
  }
  laughurls(String url) async {
    // var url=Uri.parse(url);
    if (await canLaunchUrlString(url)) {
     await launchUrlString(url);
    } else {
      throw 'Not find';
    }
  }
 
}