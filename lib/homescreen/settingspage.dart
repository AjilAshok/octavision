import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get_time_ago/get_time_ago.dart';
import 'package:intl/intl.dart';
import 'package:octavision/constant/version.dart';

import 'package:octavision/homescreen/widgets/contactpage.dart';

class Settings extends StatefulWidget {
  Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  String copytext = "octavision.t@gmail.com";

  Version ver = Version();
  bool isVisible = true;

  // var gitnumber=gitnumber;
  @override
  Widget build(BuildContext context) {
   
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        elevation: 0,
        title: Text(
          Version.versionnumber.toString(),
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.black38,
      ),
      body: GestureDetector(
        onDoubleTap: versionvisible,
        child: Container(
          color: Colors.green,
          child: Column(children: [
            // Column(
            //   children: [
            GestureDetector(
              onDoubleTap: () {
                versionvisible();
              },
              child: const ListTile(
                title: Text(
                  "About",
                  style: TextStyle(fontSize: 25),
                ),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ),
            ListTile(
              onTap: () {
                Get.to(LicensePage(
                  applicationVersion: "1.0.0",
                  applicationLegalese: "Ocatvision",
                  applicationName: "Soul",
                  applicationIcon: Image.asset("assets/appicon1.jpeg"),
                ));
              },
              title: Text(
                "Liscense",
                style: TextStyle(fontSize: 25),
              ),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            ListTile(
              onTap: () async {
                Get.to(ContactPage());
                // try {
                //   await des.add({"name": "name"}).then((value) => print("adfsn"));
                // } catch (e) {
                //   print(e);
                // }
              },
              title: const Text(
                "Contact Us",
                style: TextStyle(fontSize: 25),
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
            const Spacer(),
            Center(
                child: Visibility(
                    visible: isVisible,
                    child: Text.rich(TextSpan(
                        text: "Develped by flutter",
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            versionvisible();
                          })))),
            //   ],
            // ),
          ]),
        ),
      ),
    ));
  }

  void versionvisible() {
    setState(() {
    const dateTimeString = '2020-07-17T03:18:31.177769-04:00';
  final dateTime = DateTime.parse(dateTimeString);

  final format = DateFormat('HH:mm');
  final now =DateTime.now();
  print(now);

  final clockString = format.format(dateTime.toLocal());

  print(clockString); // 07:18 AM
    
    });

  }
}
