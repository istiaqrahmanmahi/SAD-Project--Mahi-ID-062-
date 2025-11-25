import 'package:flutter/material.dart';
import 'package:flutter_demos/homePage.dart';
import 'package:flutter_demos/assignment6.dart';
// jde ami ekta page dhore and  page er vitor ja ja thakbe ta ekta ekta widget bola hobe
//widget-> 2 type 1.ststefull ,2.ststelass
//static->ststeless
//dynamic->ststefull
//designing gula sundor korar janno --scffold()-- use korbo


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{ //implimentation of ststelesswidget
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

   return MaterialApp(
     theme: ThemeData.light(),
     debugShowCheckedModeBanner:false,

     //home: Homepage(),
     home:SetImages(),
   );
      
  }
}
 