import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:octavision/homescreen/homescreen.dart';
import 'package:octavision/splashscreen/splashscreen.dart';
List<CameraDescription> cameras = [];
Future< void> main()async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: Splashscreen()
      // Home(),
    );
  }
}



