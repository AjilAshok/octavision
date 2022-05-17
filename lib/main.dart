import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:octavision/homescreen/homescreen.dart';
import 'package:octavision/splashscreen/splashscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
List<CameraDescription> cameras = [];
int? initScreen;
Future< void> main()async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  SharedPreferences preferences=await SharedPreferences.getInstance();
  initScreen =await preferences.getInt('initScreen');
  await preferences.setInt('initScreen', 1);
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



