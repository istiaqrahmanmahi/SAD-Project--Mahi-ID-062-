
// To implement statlesswidget formet just wtite (st) then enter.

import 'package:flutter/material.dart';
import 'package:flutter_demos/grid_view.dart';
import 'package:flutter_demos/homePage.dart';
import 'package:flutter_demos/assignment6.dart';
import 'package:flutter_demos/list_Tile.dart';
import 'package:flutter_demos/list_view.dart';
import 'package:flutter_demos/login.dart';
import 'package:flutter_demos/profilepage.dart';
import 'package:flutter_demos/registration.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
//import 'package:flutter_demos/register.dart';


//Regex errr  ? ->(0 or 1)  //  + ->(1 or infinity)  //  * ->(0 or infinity)

// (CSE_\d{16}@lus\.ac\.bd) -->(CSE_0182320012101062@lus.ac.bd) -->ami jde chi amr email id set korbo ta hole emn hobe
// ( (CSE|EEE|CE)_\d{16}@lus\.ac\.bd) --> (EEE_0182320012101062@lus.ac.bd) --> or deya ami ek er besi dept er o email set korte parboo
// ([a-z\d_]{3,}@gmail\.com) -->(istiaqrahmanmahi2354@gmail.com)


// jde ami ekta page dhore and  page er vitor ja ja thakbe ta ekta ekta widget bola hobe
//widget-> 2 type 1.ststefull ,2.ststelass
//static->ststeless
//dynamic->ststefull
//designing gula sundor korar janno --scffold()-- use korbo


void main() async{

  WidgetsFlutterBinding.ensureInitialized();//supabase er janno
  await Supabase.initialize(
    url:'https://rcfhubmriybezcmjpezd.supabase.co' ,
    anonKey:'sb_publishable_obElG9M-JZ0G8XjsQLbYgQ_Q_qwSn4o',
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget{ //implimentation of ststelesswidget
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

   return MaterialApp(
     theme: ThemeData.light(),
     debugShowCheckedModeBanner:false,
     
    // home: Homepage(),
     //home:SetImages(),
     //home:list_Tile() ,
     //home:profile_Page(),
     home:MyLogin(),
    //home: ListviewPage(),
    //home: GridviewPage(),
     routes: {
      'register':(context) =>MyRegister(),
      'Login':(context) =>MyLogin(),
     },

   );
      
  }
}
 