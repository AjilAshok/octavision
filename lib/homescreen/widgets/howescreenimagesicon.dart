import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeIcons extends StatelessWidget {
  HomeIcons(
      {Key? key,
      required this.index,
      required this.names,
      required this.logimage})
      : super(key: key);
  int index;

  List names = [];
  List logimage = [];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            names[index],
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.montserrat(
                color: Colors.white, fontSize: 23, fontWeight: FontWeight.bold),
          ),
        ),
       
      ],
    );
  }
}
