


import 'package:flutter/material.dart';
import 'package:flutter_demos/login.dart';
import 'package:flutter_demos/converter_page.dart';
import 'package:flutter_demos/grid_view.dart';
import 'package:flutter_demos/list_view.dart';
import 'package:flutter_demos/profilepage.dart';
import 'package:flutter_demos/upload_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _supabase = Supabase.instance.client;

  Future<Map<String, dynamic>?> getCurrentUser() async {
    final user = _supabase.auth.currentUser;
    if (user == null) return null;
    final res =
        await _supabase.from('profiles').select().eq('id', user.id).single();
    return res;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(212, 94, 162, 195),
        foregroundColor: Colors.black,
        title: Text("HomePage"),
        // leading: Icon(Icons.home),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.favorite, color: Colors.red),
          ),
          IconButton(
            onPressed: () {
              Supabase.instance.client.auth.signOut();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => MyLogin()),
              );
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: "Add",
        child: Icon(Icons.add),
      ),
      drawer: NavigationDrawer(
        children: [
          DrawerHeader(
            child: UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.blueGrey),
              accountName: Text("Name"),
              accountEmail: Text("Email"),
            ),
          ),
          ListTile(onTap: () {}, title: Text("HomePage")),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Welcome to homepage!!!", style: TextStyle(fontSize: 20)),

              // Current user info
              FutureBuilder(
                future: getCurrentUser(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Text("Error ${snapshot.error}");
                  }
                  if (!snapshot.hasData) {
                    return const Text("No User Found!!");
                  }
                  final profile = snapshot.data as Map<String, dynamic>;
                  return SizedBox(
                    width: 300,
                    height: 300,
                    child: Card(
                      color: Colors.blueGrey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (profile['avatar_url'] != null)
                            Image.network(
                              profile['avatar_url'],
                              height: 100,
                              width: 100,
                              fit: BoxFit.cover,
                            ),

                          SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return UploadPage();
                                  },
                                ),
                              );
                            },

                            child: Text("Upload Image"),
                          ),
                          SizedBox(height: 10),
                          Text("Name: ${profile['name']}"),
                          SizedBox(height: 10),
                          Text("Email: ${profile['email']}"),
                          SizedBox(height: 10),
                        ],
                      ),
                    ),
                  );
                },
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ListviewPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey,
                      foregroundColor: Colors.white,
                      elevation: 5,
                      fixedSize: Size(150, 50),
                    ),
                    child: Text("ListView"),
                  ),

                  SizedBox(width: 20),

                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => GridviewPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey,
                      foregroundColor: Colors.white,
                      elevation: 5,
                      fixedSize: Size(150, 50),
                    ),
                    child: Text("GridView"),
                  ),
                ],
              ),

              SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ConverterPage(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey,
                      foregroundColor: Colors.white,
                      elevation: 5,
                      fixedSize: Size(150, 50),
                    ),
                    child: Text("Converter"),
                  ),

                  SizedBox(width: 20),

                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => profile_Page()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey,
                      foregroundColor: Colors.white,
                      elevation: 5,
                      fixedSize: Size(150, 50),
                    ),
                    child: Text("ProfilePage"),
                  ),
                ],
              ),
              // SizedBox(height: 20),
              SizedBox(
                height: 300,
                width: 300,
                child: Card(
                  color: Colors.amber,
                  child: Center(child: Text("Card")),
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
                  // borderRadius: BorderRadius.all(Radius.circular(20)),
                  shape: BoxShape.circle,
                ),
                child: Text("Container"),
              ),
              Image.asset('assets/images/flutter.png', height: 300),
              // Image.asset(
              //   'assets/images/images.jpeg',
              //   height: 500,
              //   fit: BoxFit.fill,
              // ),
              // Image.network(
              //   'https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&q=60&w=500',
              // ),
            ],
          ),
        ),
      ),
    );
  }
}





/*

import 'package:flutter/material.dart';
import 'package:flutter_demos/sliding_page.dart';
import 'package:flutter_demos/list_Tile.dart';
import 'package:flutter_demos/auth_gate.dart';
import 'package:flutter_demos/login.dart';
import 'package:supabase_flutter/supabase_flutter.dart';





class Homepage extends StatefulWidget{
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  final _supabase = Supabase.instance.client;

  Future<Map<String, dynamic>?> getCurrentUser() async {
    final user = _supabase.auth.currentUser;
    if (user == null) return null;
    final res =
        await _supabase.from('profiles').select().eq('id', user.id).single();
    return res;
  }

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

*/