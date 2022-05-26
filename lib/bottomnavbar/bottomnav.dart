import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:octavision/homescreen/homescreen.dart';
import 'package:octavision/secondehome/secondehomescreen.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentIndex=0;
  PageController pageController=PageController(initialPage: 0);
 
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: (newindex){
          setState(() {
            currentIndex=newindex;
          });
        },
        children: [
          Home(),
          SecondhomeScreen()
        ],
      ),
      bottomNavigationBar:BottomNavigationBar(
        selectedItemColor:Colors.purple ,
        selectedFontSize: 15,
        showUnselectedLabels: false,
        // selectedIconTheme:IconTheme(data: , child: child) ,
        
        elevation: 0,
        currentIndex: currentIndex,
        onTap: (index){
         pageController.animateToPage(index, duration:const Duration(microseconds:100 ), curve: Curves.ease);
        },
        type: BottomNavigationBarType.shifting,
        
        items:const [
        BottomNavigationBarItem(
          
          
          backgroundColor: Colors.transparent,
          icon:Icon(Icons.home,color: Colors.purple),
        label: "Home",
        ),
          BottomNavigationBarItem(
            
             backgroundColor: Colors.transparent,
            icon:Icon(Icons.camera_alt,color: Colors.purple,),
        label: "Camera",
        
        
        )
      ]) ,
    ));
    
  }
}