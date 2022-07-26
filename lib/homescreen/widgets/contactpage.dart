import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:http/http.dart' as http;

class ContactPage extends StatelessWidget {
  ContactPage({Key? key}) : super(key: key);
  final formGlobalKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController feedback = TextEditingController();
  final serviceId = 'service_drxjtqc';
  final templateid = 'template_gtf2psh';
  final userId = 'YfrQEiqZEjH1i4EIe';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Form(
        key: formGlobalKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextFormField(
                controller: name,
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Enter your name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please Enter the name";
                  }
                }),
            TextFormField(
                controller: email,
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Enter your email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please Enter the email";
                  }
                }),
            TextFormField(
                controller: feedback,
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Enter your feedback'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please Enter the Feedback";
                  }
                }),
            ElevatedButton(
                onPressed: () {
                  if (formGlobalKey.currentState!.validate()) {
                    sendmail(context);
                    // sendmail(context, "ss");
                    // details.add({'name':"name"}).then((value) => print("aji"));

                  }
                },
                child: const Text("Send"))
          ],
        ),
      ),
    ));
  }

  void _showSnackBar(context, tex) {
    var snack = SnackBar(
        backgroundColor: Colors.green,
        content: Text(tex),
        duration: Duration(seconds: 2));
    ScaffoldMessenger.of(context).showSnackBar(snack);
  }

  sendmail(context) async {
    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    final reponse = await http.post(url,
        headers: {
          'origin': 'http://localhost',
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'service_id': serviceId,
          'template_id': templateid,
          'user_id': userId,
          'template_params': {
            'user_name': name.text,
            'user_email': email.text,
            'user_subject': 'Feedback',
            'user_message': feedback.text
          }
        }));

    print(reponse.body);

    _showSnackBar(context, "Feedback send succesfully");
    name.clear();
    email.clear();
    feedback.clear();
  }
}
