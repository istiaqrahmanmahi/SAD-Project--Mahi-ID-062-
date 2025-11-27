

import 'package:flutter/material.dart';

class SetImages extends StatelessWidget{
  const SetImages({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      
      body: Center(
        child: Column(
          children: [
            Text("Welcome to Fishing Spot",style: TextStyle(fontSize: 50)),
            
            Center(
              child: Image.asset(
                'assets/images/image.jpg',
                
                height: 500,
                fit: BoxFit.fill,
              ),
            ),
            
            //Image.network('https://play-lh.googleusercontent.com/GJFhOYXbhYwmsCZN6exgGfPrgZiQ1zFbHLeHaylqG-7DLkzarVgrutLjQafp_UhUHIw'), // This is the online picture.
          ],
        ),
      ),
    );
  }
}