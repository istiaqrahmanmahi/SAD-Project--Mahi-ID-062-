

import 'package:flutter/material.dart';
import 'package:flutter_demos/sliding_page.dart';
import 'package:flutter_demos/list_Tile.dart';



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
      child:SingleChildScrollView(
       
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Text("Wlecome boy" ,style:TextStyle(fontSize: 20)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
              
                children: [
                   
                  ElevatedButton( onPressed: () {
              
                    Navigator.push(
                      context, 
                      MaterialPageRoute(
                        builder: (context)=> SlidingPage(),
                        ),
                      ); //one page to another page go (press the 'Eleveted' button to go Sliding page)
              
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
                    onPressed: (){
              
                      Navigator.push(
                      context, 
                      MaterialPageRoute(
                        builder: (context)=> list_Tile(),
                        ),
                      );// one page to another page go( press the 'Text' to go LISTs page)
                    }, 
                    style: TextButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 32, 195, 95),
                  ),
                    child:Text("Text"),
                  ),
               
                ],
              ),

              SizedBox(
                height: 300,
                width: 300,
                child: Card(
                  color: Colors.amber,
                  child: Center(child: Text("Card"),),
                ),
              ),

                Container(
                height: 300,
                width: 300,
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.all(20),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  border: Border.all(color: Colors.yellowAccent, width: 5),
                  shape: BoxShape.circle,
                ),

                child: Text("Container"),//in the container write/ do anything
              ),
            ],
          ),
        ),
      
     ),
    );
  }
}