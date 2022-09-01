

import 'package:intl/intl.dart';


// ignore: prefer_typing_uninitialized_variables


class Version{
  

   static String? versionnumber="1.2.7";
   static String? dateandtime="31/08/2022 13:15";
   static String? buildnum="buildno";
   static  DateTime dateTime=DateFormat('dd/MM/yyyy HH:mm:ss').parse('22/08/2022 20:23:15');
   static DateTime dateTimes=DateFormat('dd/MM/yyyy HH:mm').parse(dateandtime!);
  //  static DateTime dateTimes=DateTime.now() ;
  //  static final s=dateTimes.difference(dateTime).inMinutes;
 

// static const String 1.2.7=String.fromEnvironment(g);
}