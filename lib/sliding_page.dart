import 'package:flutter/material.dart';

class SlidingPage extends StatelessWidget {
  const SlidingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Colors.blueGrey,
        foregroundColor: const Color.fromARGB(255, 148, 37, 37),
        title: Text("SlidingPage"),
      ),



      body:Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
          
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 11),
                height: 200,
                color: Colors.lightGreen,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 11),
                height: 200,
                color: const Color.fromARGB(255, 15, 27, 1),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 11),
                height: 200,
                color: const Color.fromARGB(255, 68, 94, 38),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 11),
                height: 200,
                color: const Color.fromARGB(255, 106, 121, 89),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 11),
                height: 200,
                color: const Color.fromARGB(255, 106, 74, 195),
              )
            ],
          ),
        ),







      )

      

    );
  }
}