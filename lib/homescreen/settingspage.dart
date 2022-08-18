
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:octavision/constant/version.dart';

import 'package:octavision/homescreen/widgets/contactpage.dart';

class Settings extends StatelessWidget {
  Settings({Key? key}) : super(key: key);
  String copytext = "octavision.t@gmail.com";
  Version ver=Version();
  

  @override
  Widget build(BuildContext context) {
    print(Version.version);
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
        title: const Text(Version.version
          ,
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.black38,
      ),
      body: Column(
        children: [
          const ListTile(
            title: Text(
              "About",
              style: TextStyle(fontSize: 25),
            ),
            trailing: Icon(Icons.arrow_forward_ios),
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
              //           showDialog(context: context, builder: (context)=>  AlertDialog(
              //             title: const  Text("Contact us"),
              //             content: Row(
              //               children: [
              //                 Text(copytext),
              //                  IconButton(onPressed: (){
              //                   FlutterClipboard.copy(copytext).then((value) {
              //   _showSnackBar(context,"Text copied");
              // });
              //                  }, icon: Icon(Icons.copy))
              //               ],
              //             ),

              //           ));

              Get.to(ContactPage());
              // try {
              //   await des.add({"name": "name"}).then((value) => print("adfsn"));
              // } catch (e) {
              //   print(e);
              // }
            },
            title: Text(
              "Contact Us",
              style: TextStyle(fontSize: 25),
            ),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          Spacer(),
          Center(
            child: Text(
              "Developed By Octavision",
              style: TextStyle(fontSize: 20),
            ),
          )
        ],
      ),
    ));
  }

  void _showSnackBar(context, tex) {
    var snack = SnackBar(content: Text(tex), duration: Duration(seconds: 2));
    ScaffoldMessenger.of(context).showSnackBar(snack);
  }
}
