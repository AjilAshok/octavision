import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Spinner_lodading extends StatelessWidget {
  const Spinner_lodading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Container(
        color: Colors.black,
        child: const Center(
          child: SpinKitSpinningLines(
            color: Color(0XFF7F8C8D),
            size: 50.0,
          ),
        ),
      )
    );
    

  }
}