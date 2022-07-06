import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:mailer/smtp_server/gmail.dart';

class ContactPage extends StatelessWidget {
  ContactPage({Key? key}) : super(key: key);
  final formGlobalKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController feedback = TextEditingController();

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
                ElevatedButton(onPressed: (){
                  if(formGlobalKey.currentState!.validate()){
                    sendmail(context, "ss");
                    

                  }


                }, child: Text("Send"))
          ],
        ),
      ),
    ));
  }
  sendmail(context,tex)async{
    final username = 'aj4ashok@ga';
final password = 'twRyKjx2Bhf8n3vN';
final smtpServer = SmtpServer(
  'smtp-relay.sendinblue.com',
  port: 587,
  username: username,
  password: password,
);
    final message=Message()
    ..from=Address(email.text,name.text)
    ..recipients=["ajilashokdev@gmail.com"]
    ..text=feedback.text;
    var connection = PersistentConnection(smtpServer);

    try {
      await connection.send(message);
      
    }on MailerException  catch (e) {
      print(e);
      
    }
    _showSnackBar(context, tex);

  
  }
  void _showSnackBar(context,tex) {
    var snack =
        SnackBar(content: Text(tex), duration: Duration(seconds: 2));
    ScaffoldMessenger.of(context).showSnackBar(snack);
  }
}
