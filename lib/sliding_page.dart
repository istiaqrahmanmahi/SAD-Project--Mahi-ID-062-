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

    );
  }
}