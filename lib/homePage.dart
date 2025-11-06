

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Homepage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 30, 155, 17),
        foregroundColor: Colors.black,
        title: Text("HomePage"),
        //leading: Icon(Icons.home),
        actions: [
          IconButton(
            onPressed: (){},
            icon: Icon(Icons.settings)),
          IconButton(
            onPressed: (){}, 
            icon: Icon(Icons.favorite)),
        ],
      
      ),


      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        tooltip: "Add",
        child: Icon(Icons.add),
      ),

      drawer: NavigationDrawer(children: [
        DrawerHeader(child: UserAccountsDrawerHeader(
          decoration: BoxDecoration(color: Colors.blueGrey),
          accountName: Text("name"), 
          accountEmail:Text ("Email")))
      ],
      
      //ListTile(onTap: (){},title:Text("HomePage")),
      ),

      
    );
  }
}