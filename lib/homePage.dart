

import 'package:flutter/material.dart';
import 'package:flutter_demos/sliding_page.dart';

class Homepage extends StatelessWidget{
  const Homepage({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 30, 155, 17),
        foregroundColor: const Color.fromARGB(255, 66, 39, 125),
        title: Text("HomePage"),
        
        actions: [
          IconButton(
            onPressed: (){},
            icon: Icon(Icons.settings)),
          IconButton(
            onPressed: (){}, 
            icon: Icon(Icons.favorite)),
          IconButton(
            onPressed: (){},
            icon: Icon(Icons.post_add)),
        ],
      
      ),


      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        tooltip: "Add",
        child: Icon(Icons.add),
      ),

      drawer: NavigationDrawer(children:[
        DrawerHeader(
          child: UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: const Color.fromARGB(255, 43, 164, 225)),
            accountName: Text("name : Mahi"),
             
            accountEmail:Text ("Email"),
          ),
        ),
          ListTile(onTap:() {} , title: Text("HomePage")),
      ],
      
     ),



     body: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
      
        children: [
     
          ElevatedButton(onPressed: () {
            Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (context)=> SlidingPage(),
                ),
              );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 136, 143, 105),
            foregroundColor: Colors.greenAccent,
            shape: BeveledRectangleBorder(),
          ),
          child: Text("Eleveted")),
     
          OutlinedButton(
            onPressed: (){}, 
            child: Text("Outline")),
     
          TextButton(
            onPressed: (){}, 
            style: TextButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 32, 195, 95),
          ),
          child:Text("Text")),
        ],
      ),
      
      
     ),
    );
  }
}